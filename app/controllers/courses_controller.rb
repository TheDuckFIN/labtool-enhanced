class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  before_action :ensure_that_logged_in
  before_action :ensure_that_admin, only: [:new]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.leader = current_user
    @course.active = true
    @course.registeration_open = true

    if @course.save
      @course.current_week = Week.create number: 0, max_points: 0, code_review: false

      byebug

      (1..@course.week_count.to_i).each do |number|
        week = @course.weeks.create number:number, max_points: 3, code_review: false
      end

      group = @course.codereview_groups.create name:'Default group'
      @course.default_codereview_group = group

      @course.save

      redirect_to @course, notice: "Course created successfully!"
    else
      render :new
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :irc_channel, :week_count)
    end

end
