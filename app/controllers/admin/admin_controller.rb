class Admin::AdminController < ActionController::Base
  protect_from_forgery

  before_filter :verify_admin

  def verify_admin
    if current_user
      unless current_user.admin
        redirect_to '/'
        flash[:error] = "You must be an Admin to do that!"
      end
    else
      redirect_to new_user_session_path
      flash[:error] = "You must be logged in to do that!"
    end
  end

end
