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

end
