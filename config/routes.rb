Rails.application.routes.draw do
  devise_for :users
  #devise_for :users

  root 'welcome#index'
  get  "plans/index"
  post "plans/index"

  resources :guests, except: [:create] do
    post '', to: 'guest#registrations', on: :collection, as: :create
  end
  resources :owners
  resources :users, only: [:show]
  resources :plans, only: [:new, :create, :show]

end
