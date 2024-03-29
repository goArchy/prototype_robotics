class Admin::StepsController < Admin::AdminController

  def index
    @steps = Step.all
  end

  def show
    @step = Step.find(params[:id])
  end

  def new
    @tutorial = Tutorial.find(params[:tutorial])
    @step = @tutorial.steps.build
  end

  def create
    @step = Step.new(params[:step])
    if @step.save
      @tutorial = @step.tutorial
      @step.step_number = "Step " + "#{@tutorial.steps.count}"
      @step.save
      redirect_to edit_admin_tutorial_path(@tutorial)
    end
  end

  def edit
    @step = Step.find(params[:id])
    @tutorial = @step.tutorial
  end

  def update
    @step = Step.find(params[:id])
    @step.update_attributes(params[:step])
    redirect_to edit_admin_step_path(@step)
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to admin_tutorials_path
  end

end
