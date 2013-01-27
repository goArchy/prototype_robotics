PrototypeRobotics::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'


  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  root :to => 'home#index'

  namespace :admin do
    resources :projects
    resources :tutorials
    resources :steps
    resources :articles
    resources :galleries
    match "remove_image" => "galleries#remove_image"
  end

  resources :projects
  resources :tutorials
  resources :steps
  resources :articles, :path => "blog"

  match "search_projects" => "projects#search_projects"
  match "search" => "home#search"

  match "about_me" => "home#about_me"
  match "links" => "home#links"


end

