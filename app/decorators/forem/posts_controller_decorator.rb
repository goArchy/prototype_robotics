Forem::PostsController.class_eval do
  after_filter :send_emails, :only => [:create]

  def send_emails
    post_id = @post.id
    if @post.reply_to_id
      ForumNotifier.reply(post_id).deliver
    end
    unless @post.user == @post.topic.user
      ForumNotifier.notify(post_id).deliver
    end
    ForumNotifier.admin(post_id).deliver
  end

end
