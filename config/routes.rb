Rails.application.routes.draw do

  get 'login/index'
  root 'login#index'
  post 'login/login_page'
  get 'login/logout'
  resources :users
  resources :diaries
  get 'get_image/:id', to: 'diaries#get_image'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
