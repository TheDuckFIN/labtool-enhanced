class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def ensure_that_logged_in
    redirect_to login_path, alert: 'You have to login first before accessing this content!' if current_user.nil?
  end

  def ensure_that_admin
    redirect_to :root, alert: 'You need admin access to do that!' unless current_user.admin?
  end
end
