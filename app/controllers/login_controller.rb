class LoginController < ApplicationController
  def index
    if session[:login_uid]
      render 'index'
    else
      render 'login_page'
    end
  end
  
  def login_page
    if User.find_by(name: params[:name])
      user = User.find_by(name: params[:name])
      userpassword = user.password
      if BCrypt::Password.new(userpassword) == params[:password]
        session[:login_uid] = params[:name]
        redirect_to root_path
      else
        render 'error'
      end
    else
      redirect_to root_path
    end
  end
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
