class HomeController < ApplicationController

  def index
    @articles = Article.all
    @featured_articles = Article.all.select{|p| p.featured?}
    @projects = Project.all
    @tutorials = Tutorial.all
  end

end
