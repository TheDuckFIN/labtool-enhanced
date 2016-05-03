class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :join, :edit, :update, :codereviews, :weeklysubmissions]
  before_action :ensure_that_logged_in
  before_action :ensure_that_admin, only: [:new, :create, :codereviews, :weeklysubmissions, :update, :edit, :addteacher]

  def index
    @courses = Course.active.all
  end

  def addteacher
    part = Participation.new course_id:params[:course_id], user_id:params[:user_id], teacher:true

    if part.save
      redirect_to :back, notice:'Added teacher successfully!'
    else
      redirect_to :back, alert:'Teacher adding failed! Issue bug report!'
    end
  end

  def show
  end

  def edit
  end

  def codereviews

  end

  def weeklysubmissions

  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course updated successfully'
    else
      render 'edit'
    end
  end

  def join
    @participation = Participation.new
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

      (1..@course.week_count.to_i).each do |number|
        @course.weeks.create number:number, max_points: 3, code_review: false
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
