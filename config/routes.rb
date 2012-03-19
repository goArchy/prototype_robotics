PrototypeRobotics::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, :at => '/'

  #devise_for :users
  #get "home/index"
  #root :to => 'home#index'

  match "search_projects" => "projects#search_projects"
  match "search" => "home#search"

end

