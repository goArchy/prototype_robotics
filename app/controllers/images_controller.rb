class ImagesController < ApplicationController
  before_filter :verify_user

  def new
    @project = Project.find(params[:project])
    if @project.gallery.nil?
      @gallery = Gallery.create(project_id: @project.id)
      @image = @gallery.images.new
    else
      @image = @project.gallery.images.new
    end
  end

  def create
    @gallery = Gallery.find(params[:image][:gallery_id])
    @image = @gallery.images.create(params[:image])
    redirect_to edit_project_path(@gallery.project)
  end

  def remove
    @image = Image.find(params[:image_id])
    @image.destroy
    redirect_to edit_project_path(@image.gallery.project)
  end

  def verify_user
    if params[:project]
      user = Project.find(params[:project]).user
      current_user == user
    elsif params[:image]
      user = Gallery.find(params[:image][:gallery_id]).project.user
      current_user == user
    elsif params[:image_id]
      user = Image.find(params[:image_id]).gallery.project.user
      current_user == user
    else
      flash["warning"] = "Hey now, don't do that."
      redirect_to root_path
    end
  end

end
