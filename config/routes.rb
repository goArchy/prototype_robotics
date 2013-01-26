PrototypeRobotics::Application.routes.draw do

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

