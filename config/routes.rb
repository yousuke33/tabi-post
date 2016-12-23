Rails.application.routes.draw do
  devise_for :users
  #devise_for :users

  root 'welcome#index'
  get  "plans/index"
  post "plans/index"

  resources :guests
  resources :owners
  resources :plans, only: [:new, :create, :show]

end
