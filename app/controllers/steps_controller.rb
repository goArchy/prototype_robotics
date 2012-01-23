class StepsController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :destroy]

  def index
    @steps = Step.all
  end

  def show
    @step = Step.find(params[:id])
  end

  def new
    @step = Step.new
    @step.tutorial_id = params[:tutorial]
    @tutorial = @step.tutorial
  end

  def create
    @step = Step.new(params[:step])
    if @step.save
      @tutorial = @step.tutorial
      @step.step_number = "Step " + "#{@tutorial.steps.count}"
      @step.save
      redirect_to new_step_path(tutorial: @tutorial)
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step.update_attributes(params[:step])
  end

end
