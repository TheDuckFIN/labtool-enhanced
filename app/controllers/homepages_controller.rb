class HomepagesController < ApplicationController
  def index
    @user = current_user
    if @user.nil?
      @user = User.new
      render 'nologin'
    else
      @active_courses = @user.courses.active
      @finished_courses = @user.courses.finished
      render 'index'
    end
  end
end
