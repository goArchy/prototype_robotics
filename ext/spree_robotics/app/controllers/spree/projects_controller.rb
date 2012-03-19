class Spree::ProjectsController < ApplicationController

  def index
    @projects = Spree::Project.all
  end

  def show
    @project = Spree::Project.find(params[:id])
  end

end
