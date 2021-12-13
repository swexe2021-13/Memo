class LoginController < ApplicationController
  def index
    if session[:login_uid]
      render 'index'
    else
      render 'login_page'
    end
  end
  
  def login_page
    if User.find_by(email: params[:email])
      user = User.find_by(email: params[:email])
      if user.name == params[:name]
        userpassword = user.password
        if BCrypt::Password.new(userpassword) == params[:password]
          u_id = user.id
          session[:login_uid] = u_id
          redirect_to diaries_path
        else
          render 'error'
        end
      else
        render 'error'
      end
    else
      render 'error'
    end
  end
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
