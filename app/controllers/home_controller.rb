class HomeController < ApplicationController
  layout 'application'

  def about_me
  end

  def links
  end

  def index
    @featured_content = Article.all.select{|a| a.featured? && a.published?}
    @featured_projects = Project.all.select{|p| p.featured? && p.published?}
    if !@featured_projects.empty?
      @featured_projects.each do |project|
        @featured_content.push(project)
      end
    end
    @articles = Article.where(:published => "true").last(3).reverse
    @projects = Project.where(:published => "true").last(3).reverse
    @tutorials = Tutorial.all.last(3).reverse
  end

end
