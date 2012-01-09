class TutorialsController < ApplicationController

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

end
