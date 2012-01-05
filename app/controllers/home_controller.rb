class HomeController < ApplicationController

  def index
    @posts = Post.all
    @featured_posts = Post.all.select{|p| p.featured?}
  end

end
