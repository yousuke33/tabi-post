Rails.application.routes.draw do
  devise_for :users
  #devise_for :users

  root 'welcome#index'

  resources :guests
  resources :owners
  resources :plans, only: [:index, :new, :create, :show]

end
