Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  devise_for :users
  root to: "pages#home"
  resources :pubs do
    resources :reviews
    resources :locals
    resources :chats
  end

  get "pubs/:id", to: "pubs#random"
  get "dogs/new", to: "dogs#new"
  get "dogs/:id/edit", to: "dogs#edit"
  post "dogs", to: "dogs#create"
  delete "dogs/:id", to: "dogs#destroy"
  resources :pub
  resources :reviews
  resources :dogs
  post "room_messages", to: "room_messages#create"

  resources :room_messages

  resources :rooms
  resources :favourites

end
