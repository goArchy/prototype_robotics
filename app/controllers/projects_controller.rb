class ProjectsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :search_projects]

  def index
    @projects = Project.active.published
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    if params[:id].present?
      @user = User.find(params[:id])
      @project = @user.projects.new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.new(params[:project])
    if @project.save
      @project.notifications.create(message: "#{@project.user.username} just created project #{@project.name}.")
      send_email
      redirect_to dashboard_path, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    verify_user(@project.user)
    if @project.update_attributes(params[:project])
      @project.notifications.create(message: "#{@project.user.username} just updated project #{@project.name}.")
      redirect_to dashboard_path, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    verify_user(@project.user)
    @project.deleted = true
    @project.save
    redirect_to dashboard_path, notice: 'Project was successfully deleted.'
  end

  def search_projects
    @projects = Project.published.active.select{|p| p.category == params[:category] }
    render "index"
  end

  def verify_user(user)
    if user == current_user
      return true
    else
      redirect_to root_path, notice: 'You are not allowed to create projects for other users.'
    end
  end

  def send_email
    ProjectNotifier.admin(@project.id).deliver
  rescue
    "The email failed yo"
  end

end

