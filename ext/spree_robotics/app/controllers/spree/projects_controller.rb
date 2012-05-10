class Spree::ProjectsController < ApplicationController
  before_filter :get_categories, :only => [:index, :search_projects]

  def index
    @projects = Spree::Project.all
  end

  def show
    @project = Spree::Project.find(params[:id])
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
