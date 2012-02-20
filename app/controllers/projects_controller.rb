class ProjectsController < ApplicationController
  before_filter :admin_required, :only => [:destroy]
  before_filter :login_required, :only => [:new, :edit]
  before_filter :remove_image, :only => [:edit]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

  def search_projects
    @projects = Project.all.select{|p| p.category == params[:category]}
    render "search"
  end

  def remove_image
    @project = Project.find(params[:id])
    if @project.remove_image?
      begin
        @project.image.destroy
      rescue
      end
      @project.remove_image = false
      @project.save
    end
  end

end
