Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pubs do
    resources :reviews
    resources :locals
  end
  resources :dogs
end
