# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'publications#index'
  resource :users, only: %i[create] do
    get :login
    post :login
    get :logout
    get :form
  end
  resources :publications, only: %i[new index create show destroy] do
    post :approval
    post :acception
    post :denial
  end
end
