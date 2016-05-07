class WeeksController < ApplicationController
  before_action :set_course_and_week

  def edit

  end

  def update

  end

  private

    def set_course_and_week
      @week = Week.find(params[:id])
      @course = Course.find(params[:id])
    end

 end