PrototypeRobotics::Application.routes.draw do

  root :to => 'home#index'
#  mount Forem::Engine, :at => "/forums"
  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, :at => '/store'


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
  match "search" => "search#search"

  match "about_me" => "home#about_me"
  match "links" => "home#links"

end

