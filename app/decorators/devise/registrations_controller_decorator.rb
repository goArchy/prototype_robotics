Devise::RegistrationsController.class_eval do
  after_filter :approve_forem, :only => [:create]

  def approve_forem
    @user.notifications.create(message: "#{@user.name.username} just registered.")
    @user.forem_state = "approved"
    @user.save
  end

end
