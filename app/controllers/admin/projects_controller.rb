class Admin::ProjectsController < Admin::AdminController

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
      update_admin_attributes
      redirect_to admin_projects_path, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      update_admin_attributes
      redirect_to edit_admin_project_path(@project), notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path
  end

  def approve
    @project = Project.find(params[:id])
    @project.published = true
    @project.save
    redirect_to admin_projects_path
  end

  def update_admin_attributes
    @project.featured = true if params[:project][:featured] == "1"
    @project.published = true if params[:project][:published] == "1"
    @project.save
  end

end
