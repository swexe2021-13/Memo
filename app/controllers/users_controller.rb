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
      redirect_to root_path
      # Handle a successful save.
    else
      render 'new'
    end
    
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to login_logout_path
  end
end


