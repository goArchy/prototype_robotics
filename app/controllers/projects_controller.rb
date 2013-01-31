class ProjectsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :search_projects]

  def index
    @projects = Project.where(:published => true).select{|s| s.deleted != true}
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
    @project = @user.projects.new(params[:project])
    if @project.save
      redirect_to dashboard_index_path, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to dashboard_index_path, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.deleted = true
    @project.save
    redirect_to dashboard_index_path, notice: 'Project was successfully deleted.'
  end

  def search_projects
    @projects = Project.all.select{|p| p.category == params[:category] && p.published == true }
    render "index"
  end

end

