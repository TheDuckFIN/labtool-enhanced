class SessionsController < ApplicationController
  before_action :check_login, except: :destroy

  def new
  end

  def create
    user = User.where("lower(username) = lower(?)", params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root, notice: "Welcome back, #{user.format_name(false)}!"
    else
      redirect_to :back, alert: "Incorrect username or password! Please try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Logged out successfully!"
  end

  private

    def check_login
      redirect_to :root, alert: "You're already logged in!" unless session[:user_id].nil?
    end
end
