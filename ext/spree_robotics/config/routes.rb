Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :projects
    resources :tutorials
    resources :steps
    resources :articles
  end
  
  resources :projects
  resources :tutorials
  resources :steps
  resources :articles
  
  match "search_projects" => "projects#search_projects"
  match "search" => "home#search"
  
end
