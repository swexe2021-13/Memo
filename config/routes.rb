Rails.application.routes.draw do
  
  resources :users
  resources :diaries
  get 'get_image/:id', to: 'diaries#get_image'
  root 'diaries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
