class Spree::ArticlesController < ApplicationController
  before_filter :admin_required, :only => [:destroy, :new, :edit]
  before_filter :remove_image, :only => [:edit]

  def index
    @articles = Spree::Article.all
  end

  def show
    @article = Spree::Article.find(params[:id])
  end

  def new
    @article = Spree::Article.new
  end

  def edit
    @article = Spree::Article.find(params[:id])
  end

  def create
    @article = Spree::Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @article = Spree::Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @article = Spree::Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end

  def remove_image
    @article = Spree::Article.find(params[:id])
    if @article.remove_image?
      begin
        @article.image.destroy
      rescue
      end
      @article.remove_image = false
      @article.save
    end
  end
end
