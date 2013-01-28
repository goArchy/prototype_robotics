class Admin::ArticlesController < Admin::ApplicationController
  before_filter :remove_image, :only => [:edit]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to admin_articles_path, notice: 'Article was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_article_path(@article), notice: 'Article was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  def remove_image
    @article = Article.find(params[:id])
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
