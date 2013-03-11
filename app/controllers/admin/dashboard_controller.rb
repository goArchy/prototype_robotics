class Admin::DashboardController < Admin::AdminController
  def index
  end

  def read_notice
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
    redirect_to admin_path
  end

  def read_all_notices
    Notification.all.each do |notice|
      notice.read = true
      notice.save
    end
    redirect_to admin_path
  end

end
