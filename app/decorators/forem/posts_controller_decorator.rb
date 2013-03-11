Forem::PostsController.class_eval do
  after_filter :send_emails, :only => [:create]

  def send_emails
    post_id = @post.id
    Notification.create(message: "#{@post.user.username} posted to the forums.", post_id: post_id)
    @reply_to_user = User.find(@post.reply_to_id) if @post.reply_to_id
    if @reply_to_user && @reply_to_user.forem_emails
      ForumNotifier.reply(post_id).deliver
    elsif @post.user != @post.topic.user && @reply_to_user != @post.topic.user && @post.topic.user.forem_emails
      ForumNotifier.notify(post_id).deliver
    end
    ForumNotifier.admin(post_id).deliver
  end

end

