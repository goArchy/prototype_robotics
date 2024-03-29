PrototypeRobotics::Application.routes.draw do
  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  root :to => 'home#index'
  mount Forem::Engine, :at => '/forums'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  get "dashboard" => "dashboard#index"
  get "alerts" => "dashboard#alerts"
  post "change_user_password" => "passwords#change_password"
  resources :projects
  resources :tutorials
  resources :steps
  resources :articles, :path => "blog"
  resources :galleries
  resources :images do
    get "remove" => "images#remove"
  end

  match "/admin" => "admin/dashboard#index"
  namespace :admin do
    resources :users
    resources :projects
    post "approve_project" => "projects#approve"
    resources :tutorials
    resources :steps
    resources :articles
    resources :galleries
    get "read_notice"       => "dashboard#read_notice"
    get "read_all_notices"  => "dashboard#read_all_notices"
  end

  match "search_projects" => "projects#search_projects"
  match "search" => "home#search"

  get "about_me" => "home#about_me"
  get "links" => "home#links"

end

