Spree::HomeController.class_eval do
  before_filter :add_vars, :only => [:index]
  layout 'application'

  def about_me
  end

  def links
  end

  def add_vars
    @featured_content = Spree::Article.all.select{|a| a.featured? && a.published?}
    @featured_projects = Spree::Project.all.select{|p| p.featured? && p.published?}
    if !@featured_projects.empty?
      @featured_projects.each do |project|
        @featured_content.push(project)
      end
    end
    @articles = Spree::Article.where(:published => "true").last(3)
    @projects = Spree::Project.where(:published => "true").last(3)
    @tutorials = Spree::Tutorial.all.last(3)
  end

  def search
    if params["search"]
      @search = params["search"]
      @search_results = PgSearch.multisearch(@search)

      @projects = []
      @search_results.select{|p| p.searchable_type == "Spree::Project"}.each do |project|
        @projects.push(Spree::Project.find(project.searchable_id))
      end

      @articles = []
      @search_results.select{|p| p.searchable_type == "Spree::Article"}.each do |article|
        @articles.push(Spree::Article.find(article.searchable_id))
      end

      @tutorials = []
      @search_results.select{|p| p.searchable_type == "Spree::Tutorial"}.each do |tutorial|
        @tutorials.push(Spree::Tutorial.find(tutorial.searchable_id))
      end
      render 'home/search'
    else
      redirect_to '/'
    end
  end

end
