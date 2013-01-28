class Admin::GalleriesController < Admin::ApplicationController

  def new
    if params[:type] == "article"
      @article = Article.find(params[:article])
      @gallery = @article.galleries.build
      @gallery.gallery_type = "article"
    elsif params[:type] == "project"
      @project = Project.find(params[:project])
      @gallery = @project.galleries.build
      @gallery.gallery_type = "project"
    elsif params[:type] == "step"
      @step = Step.find(params[:step])
      @gallery = @step.galleries.build
      @gallery.gallery_type = "step"
    elsif params[:type] == "tutorial"
      @tutorial = Tutorial.find(params[:tutorial])
      @gallery = @tutorial.galleries.build
      @gallery.gallery_type = "tutorial"
    else
    end
    @gallery_image = @gallery.images.build
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @gallery_image = @gallery.images.build
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery was successfully created. You may now start adding images.'
    else
      render action: "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to :back
  end

  def remove_image
    @image = Image.find(params[:image_id])
    @image.destroy
    redirect_to :back, notice: "Image removed successfully"
  end
end
