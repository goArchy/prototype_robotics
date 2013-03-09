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
    @user = User.find(params[:project][:user_id])
    verify_user(@user)
    @project = @user.projects.new(params[:project])
    if @project.save
      redirect_to dashboard_path, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    verify_user(@project.user)
    if @project.update_attributes(params[:project])
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

  def verify_user(user)
    if user == current_user
      return true
    else
      redirect_to root_path, notice: 'You are not allowed to create projects for other users.'
    end
  end

  def search_projects
    @projects = Project.published.active.select{|p| p.category == params[:category] }
    render "index"
  end

end

