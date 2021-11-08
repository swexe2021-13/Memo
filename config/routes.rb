Rails.application.routes.draw do
  get 'login/index'
  root 'login#index'
  post 'login/login_page'
  get 'login/logout'
end
