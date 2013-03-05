Devise::RegistrationsController.class_eval do
  after_filter :approve_forem, :only => [:create]

  def approve_forem
    @user.forem_state = "approved"
    @user.save
  end

end
