Rails.application.routes.draw do
  
  resources :users
  resources :diaries
  delete 'diaries/:id', to: 'diaries#destroy'
  get 'diaries/:id/edit', to: 'diaries#edit'
  patch 'diaries/:id', to: 'diaries#update'
  get 'get_image/:id', to: 'diaries#get_image'
  root 'diaries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
