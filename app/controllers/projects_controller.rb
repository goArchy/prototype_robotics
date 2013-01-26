class ProjectsController < ApplicationController
  before_filter :get_categories, :only => [:index, :search_projects]

  def index
    @projects = Project.where(:published => "true")
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
      redirect_to '/account', notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to '/account', notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def search_projects
    @projects = Project.all.select{|p| p.category == params[:category] && p.published == true }
    render "index"
  end

  def get_categories
    @project_categories = []
    Project.all.each do |p|
      if !@project_categories.include?(p.category)
        @project_categories.push(p.category)
      end
    end
  end

end

