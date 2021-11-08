Rails.application.routes.draw do
  get 'diaries/index', to: 'diaries#index'
  get 'diaries/new', to: 'diaries#new'
  resources :users
  resources :diaries
  root 'diaries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
