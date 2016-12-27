Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  # devise_for :guests, controllers: { registrations: 'guest/registrations' }
  # post 'guests', to: 'guest/registrations#create' 

  root 'welcome#index'
  get  'plans', to: 'plans#index'
  post 'plans', to: 'plans#index'

  resources :guests, except: [:create] 
  # post 'guests', to: 'guests/registrations#create'
  resources :owners
  resources :users, only: [:show]
  resources :plans, only: [:new, :create, :show]

end
