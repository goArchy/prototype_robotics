class ImagesController < ApplicationController

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

end
