class ArticlesController < ApplicationController

  def index
    @articles = Article.published.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

end
