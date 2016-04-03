class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where("lower(username) = lower(?)", params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back!"
    else
      redirect_to :back, alert: "Username or password was incorrect! Please try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Logged out successfully!"
  end
end
