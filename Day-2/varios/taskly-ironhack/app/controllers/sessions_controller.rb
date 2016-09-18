class SessionsController < ApplicationController
  skip_before_action :is_logged_in?, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user and user.authenticate params[:session][:password]
      session[:user_id] = user.id
      redirect_to user
    else
      #redirect_to '/login'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    #redirect_to '/login'
    redirect_to login_path
  end
end
