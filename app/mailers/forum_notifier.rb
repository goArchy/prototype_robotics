class ForumNotifier < ActionMailer::Base
  default :from => "forums@prototyperobotics.com"

  def reply(post_id)
    # send email to post creator when a reply is made to it
    @post = Forem::Post.find(post_id)
    @user = Forem::Post.find(@post.reply_to_id).user
    @url = forem.forum_topic_url(@post.topic.forum, @post.topic)
    mail(:to => @user.email, :subject => "PrototypeRobotics Forums: user #{@post.user.username} responded to your post.")
  end

  def notify(post_id)
    # send email to topic creator when a post is made to it
    @post = Forem::Post.find(post_id)
    @user = @post.topic.user
    @url = forem.forum_topic_url(@post.topic.forum, @post.topic)
    mail(:to => @user.email, :subject => "PrototypeRobotics Forums: user #{@post.user.username} made a post on a thread you created.")
  end

  def admin(post_id)
    # send email to topic creator when a post is made to it
    @post = Forem::Post.find(post_id)
    @user = @post.topic.user
    @url = forem.forum_topic_url(@post.topic.forum, @post.topic)
    @to = User.select{|s| s.admin == true }.map(&:email)
    mail(:to => @to, :subject => "PrototypeRobotics Forums: user #{@post.user.username} made a post to thread #{@post.topic.subject}.")
  end

end
