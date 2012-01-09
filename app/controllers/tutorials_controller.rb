class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.all
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  def new
    @tutorial = Tutorial.new
    @step = @tutorial.steps.build
  end

  def create
    @tutorial.new(params[:tutorial])
    if @tutorial.save
      redirect_to tutorial_path(@tutorial) 
    end
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial.update_attributes(params[:tutorial])
    if @tutorial.save
      redirect_to tutorial_path(@tutorial) 
    end
  end

end
