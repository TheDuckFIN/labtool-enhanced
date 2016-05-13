class WeeklySubmissionsController < ApplicationController
  before_action :ensure_that_admin
  before_action :set_course

  def edit

  end

  def new
    @weekly_submission = WeeklySubmission.new
    @weekly_submission.participation_id = params[:participation]
  end

  def update

  end

  def create
    @weekly_submission = WeeklySubmission.new(weekly_submission_params)
    @weekly_submission.week = @course.current_week
    @weekly_submission.participation_id = params[:participation_id]

    if @weekly_submission.save
      redirect_to review_students_course_path(@course), notice: 'Review saved!'
    else
      render 'new'
    end
  end

  private

    def weekly_submission_params
      params.require(:weekly_submission).permit(:points)
    end

    def set_course
      @course = Course.find_by(params[:course_id])
    end

end