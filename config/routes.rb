Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:index, :edit, :update]
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
end
