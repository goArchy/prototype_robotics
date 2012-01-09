class StepsController < ApplicationController

  def index
    @steps = Step.all
  end

  def show
    @step = Step.find(params[:id])
  end

  def new
    @step = Step.new
  end

  def create
    @step.save(params[:step])
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step.update_attributes(params[:step])
  end

end
