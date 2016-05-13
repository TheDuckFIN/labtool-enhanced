class WeeksController < ApplicationController
  before_action :set_course, only: [:edit]
  before_action :set_week

  def edit
  end

  def update
    if @week.update(week_params)
      redirect_to manage_weeks_course_path(@week.course_id), notice: "Updated week #{@week.number} successfully"
    else
      @course = @week.course
      render 'edit'
    end
  end

  private

    def set_week
      @week = Week.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def week_params
      params.require(:week).permit(:max_points)
    end

end