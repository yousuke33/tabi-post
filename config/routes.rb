Rails.application.routes.draw do
  devise_for :users
  #devise_for :users

  root 'welcome#index'

  resources :guests
  resources :owners
end
