class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(
    name: params[:user][:name],
    email: params[:user][:email],
    password: params[:user][:password])
    if @user.save
      redirect_to users_path
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


