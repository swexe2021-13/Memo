class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create 
    require 'bcrypt'
    @name = params[:user][:name]
    @password = params[:user][:password]
    @userpass = BCrypt::Password.create(@password)
    @email = params[:user][:email]
    @user = User.new(name: @name,password: @userpass,email: @email)
    if @user.save
      flash[:notice] = "ユーザーがひとつ登録されました"
      redirect_to root_path
      # Handle a successful save.
    else
      render 'new'
    end
    
  end
  

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end


