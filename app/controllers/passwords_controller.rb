class PasswordsController < ApplicationController
  before_filter :verify

  def change_password
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      flash[:notice] = "Your password has been successfully changed."
    else
      flash[:alert] = "There was an error changing your password, please try again."
    end
    redirect_to dashboard_path
  end

  private

  def verify
    @user = User.find(params[:user_id])
  rescue
    flash[:alert] = "You must log in to do that"
    redirect_to root_path
  end

end
