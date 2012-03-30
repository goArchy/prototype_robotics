Spree::Admin::UsersController.class_eval do
  before_filter :update_forem_admin, :only => [:create, :update]

  def update_forem_admin
    if params[:user][:forem_admin] 
      @user = Spree::User.find(params[:id])
      @user.forem_admin = params[:user][:forem_admin]
      @user.save
    end
  end
end
