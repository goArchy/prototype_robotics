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
    @featured_content = Article.published.featured
    @featured_projects = Project.active.published.featured
    if !@featured_projects.empty?
      @featured_projects.each do |project|
        @featured_content.push(project)
      end
    end
    @articles = Article.published.order("created_at ASC").last(3).reverse
    @projects = Project.active.published.order("created_at ASC").last(3).reverse
    @tutorials = Tutorial.order("created_at ASC").all.last(3).reverse
  end

  def search
    if params["search"]
      @search = params["search"]
      @search_results = PgSearch.multisearch(@search)

      @results = []
      @search_results.select{|p| p.searchable_type == "Project"}.each do |project|
        p = Project.find(project.searchable_id)
        @results.push(p) if p.active?
      end

      @search_results.select{|p| p.searchable_type == "Article"}.each do |article|
        a = Article.find(article.searchable_id)
        @results.push(a) if a.active?
      end

      @search_results.select{|p| p.searchable_type == "Tutorial"}.each do |tutorial|
        @results.push(Tutorial.find(tutorial.searchable_id))
      end
      render 'home/search'
    else
      redirect_to '/'
    end
  end

end
