class HomeController < ApplicationController

  def index
    @featured_content = Article.all.select{|a| a.featured?}
    @featured_projects = Project.all.select{|p| p.featured?}
    if !@featured_projects.empty?
      @featured_projects.each do |project|
        @featured_content.push(project)
      end
    end
    @articles = Article.all.reverse.take(3)
    @projects = Project.all.reverse.take(3)
    @tutorials = Tutorial.all.reverse.take(3)
  end

  def search
    if params["search"]
      @search = params["search"]
      @search_results = PgSearch.multisearch(@search)

      @projects = []
      @search_results.select{|p| p.searchable_type == "Project"}.each do |project|
        @projects.push(Project.find(project.searchable_id))
      end

      @articles = []
      @search_results.select{|p| p.searchable_type == "Article"}.each do |article|
        @articles.push(Article.find(article.searchable_id))
      end

      @tutorials = []
      @search_results.select{|p| p.searchable_type == "Tutorial"}.each do |tutorial|
        @tutorials.push(Tutorial.find(tutorial.searchable_id))
      end
      render 'home/search'
    else
      redirect_to '/'
    end
  end

end
