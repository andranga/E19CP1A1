Rails.application.routes.draw do
  get 'tasks/create'
  get 'orders/create'
  resources :projects, only: :index do
  	resources :tasks, only: :create
  end

  resources :tasks, only: :index

  root to: 'projects#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
