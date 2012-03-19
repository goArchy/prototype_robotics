class Spree::Admin::TutorialsController < Spree::Admin::ResourceController
  before_filter :admin_required, :only => [:destroy, :new, :edit]
  before_filter :remove_image, :only => [:edit]

  def index
    @tutorials = Tutorial.all
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def new
    @tutorial = Tutorial.new()
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
    if @tutorial.save
      redirect_to new_step_path(tutorial: @tutorial)
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    @tutorial.update_attributes(params[:tutorial])
    if @tutorial.save
      redirect_to edit_tutorial_path(@tutorial) 
    end
  end

  def remove_image
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.remove_image?
      begin
        @tutorial.image.destroy
      rescue
      end
      @tutorial.remove_image = false
      @tutorial.save
    end
  end
end
