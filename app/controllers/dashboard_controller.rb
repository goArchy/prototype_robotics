class DashboardController < ApplicationController
  before_filter :authenticate

  def index
  end

  def alerts
    user = current_user
    if user.forem_emails
      user.forem_emails = false
      user.save
    else
      user.forem_emails = true
      user.save
    end
    redirect_to dashboard_path
  end

end
