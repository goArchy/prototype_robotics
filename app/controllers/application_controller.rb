class ApplicationController < ActionController::Base

  protect_from_forgery

  def forem_user
    current_user
  end
  helper_method :forem_user

  def authenticate
    unless current_user
      flash[:notice] = "You must be logged in to view that page."
      redirect_to new_user_session_path
    end
  end

end
