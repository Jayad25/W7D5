class Api::SessionsController < ApplicationController
  def new

  end

  def create
    @user= User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
    login(@user)
    else
      flash[:errors] = "Invalid username and password"
      render :new
    end
  end


  def destroy
    logout
    redirect_to api/session_url
  end

end
