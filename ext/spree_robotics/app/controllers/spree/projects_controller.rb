class Spree::ProjectsController < ApplicationController
  before_filter :get_categories, :only => [:index, :search_projects]

  def index
    @projects = Spree::Project.where(:published => "true")
  end

  def show
    @project = Spree::Project.find(params[:id])
  end

  def new
    if params[:id].present?
      @user = Spree::User.find(params[:id])
      @project = @user.projects.new
    end
  end

  def edit
    @project = Spree::Project.find(params[:id])
  end

  def create
    @user = Spree::User.find(params[:project][:user_id])
    @project = @user.projects.new(params[:project])
    if @project.save
      redirect_to '/account', notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Spree::Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to '/account', notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def search_projects
    @projects = Spree::Project.all.select{|p| p.category == params[:category]}
    render "index"
  end

  def get_categories
    @project_categories = []
    Spree::Project.all.each do |p|
      if !@project_categories.include?(p.category)
        @project_categories.push(p.category)
      end
    end
  end

end

