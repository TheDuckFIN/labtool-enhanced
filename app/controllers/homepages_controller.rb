class HomepagesController < ApplicationController
  def index
    @user = current_user
    if @user.nil?
      @user = User.new
      render 'nologin'
    else
      @active_courses = Course.active
      @finished_courses = Course.finished
      @personal_courses = @user.courses
      render 'index'
    end
  end
end
