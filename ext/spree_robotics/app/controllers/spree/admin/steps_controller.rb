class Spree::Admin::StepsController < Spree::Admin::ResourceController
  before_filter :login_required, :only => [:new, :edit, :destroy]

  def index
    @steps = Spree::Step.all
  end

  def show
    @step = Spree::Step.find(params[:id])
  end

  def new
    @step = Spree::Step.new
    @step.tutorial_id = params[:tutorial]
    @tutorial = @step.tutorial
  end

  def create
    @step = Spree::Step.new(params[:step])
    if @step.save
      @tutorial = @step.tutorial
      @step.step_number = "Step " + "#{@tutorial.steps.count}"
      @step.save
      redirect_to new_step_path(tutorial: @tutorial)
    end
  end

  def edit
    @step = Spree::Step.find(params[:id])
    @tutorial = @step.tutorial
  end

  def update
    @step = Spree::Step.find(params[:id])
    @step.update_attributes(params[:step])
    redirect_to edit_tutorial_path(@step.tutorial)
  end

end