class HomepagesController < ApplicationController
  def index
    @user = current_user
    if @user.nil?
      nologin_homepage
    elsif @user.admin?
      admin_homepage
    else
      student_homepage
    end
  end

  private

    def nologin_homepage
      @user = User.new
      render 'nologin'
    end

    def student_homepage
      @active_courses = @user.courses.active
      @finished_courses = @user.courses.finished
      render 'index'
    end

    def admin_homepage
      @active_courses = @user.own_courses.active
      @finished_courses = @user.own_courses.finished
      render 'admin'
    end

end
