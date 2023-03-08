Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pubs do
    resources :reviews
    resources :locals
  end

  get "dogs/new", to: "dogs#new"
  get "dogs/:id/edit", to: "dogs#edit"
  post "dogs", to: "dogs#create"
  delete "dogs/:id", to: "dogs#destroy"
  resources :pub
  resources :reviews

  resources :dogs
end
