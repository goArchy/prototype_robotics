class HomeController < ApplicationController
  before_filter :add_vars, :only => [:index]
  layout 'application'

  def about_me
  end

  def links
  end

  def index
  end

  def add_vars
    @featured_content = Article.all.select{|a| a.featured? && a.published?}
    @featured_projects = Project.all.select{|p| p.featured? && p.published?}
    if !@featured_projects.empty?
      @featured_projects.each do |project|
        @featured_content.push(project)
      end
    end
    @articles = Article.published.order("created_at ASC").last(3).reverse
    @projects = Project.published.order("created_at ASC").last(3).reverse
    @tutorials = Tutorial.order("created_at ASC").all.last(3).reverse
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
