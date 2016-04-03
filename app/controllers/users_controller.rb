class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :ensure_that_logged_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User created successfully!"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :realname, :irc_nick, :email)
    end

end
