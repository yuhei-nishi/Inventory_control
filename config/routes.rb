Rails.application.routes.draw do
  root "groups#index"
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
end
