class ApplicationController < ActionController::Base
  protect_from_forgery
  @featured_posts = Post.all.select{|p| p.featured?}
end
