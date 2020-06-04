Rails.application.routes.draw do
  root "groups#index"
  resources :groups, only: [:show, :new]
  resources :items, only: [:index, :new, :show]
end