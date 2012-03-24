class Spree::Admin::StepsController < Spree::Admin::ResourceController

  def index
    @steps = Spree::Step.all
  end

  def show
    @step = Spree::Step.find(params[:id])
  end

  def new
    @tutorial = Spree::Tutorial.find(params[:tutorial])
    @step = @tutorial.steps.build
  end

  def create
    @step = Spree::Step.new(params[:step])
    if @step.save
      @tutorial = @step.tutorial
      @step.step_number = "Step " + "#{@tutorial.steps.count}"
      @step.save
      redirect_to edit_admin_tutorial_path(@tutorial)
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

  def destroy
    @step = Spree::Step.find(params[:id])
    @step.destroy
    redirect_to admin_tutorials_path
  end

end
