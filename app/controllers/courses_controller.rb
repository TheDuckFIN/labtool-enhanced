class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :join, :leave, :edit, :update, :codereviews, :review_students, :advance_week, :manage_weeks]
  before_action :ensure_that_logged_in
  before_action :ensure_that_admin, only: [:new, :create, :codereviews, :reviews_tudents, :update, :edit, :add_teacher, :advance_week, :manage_weeks]

  def index
    @courses = Course.active.all
  end

  def add_teacher
    part = Participation.new course_id:params[:course_id], user_id:params[:user_id], teacher:true

    if part.save
      redirect_to :back, notice:'Added teacher successfully!'
    else
      redirect_to :back, alert:'Teacher adding failed! Issue bug report!'
    end
  end

  def advance_week
    next_week = @course.next_week

    if next_week.nil?
      redirect_to :back, alert: 'This is the last week!'
    else
      @course.update_attribute(:current_week, next_week)
      redirect_to :back, notice: "Advanced to week #{next_week.number} successfully!"
    end
  end

  def show
  end

  def edit
  end

  def codereviews
  end

  def review_students
  end

  def manage_weeks
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

  def leave
    participation = Participation.find_by user:current_user, course:params[:id]

    if participation.nil?
      redirect_to :back, alert: 'Participation could not be found'
    else
      participation.destroy
      redirect_to :back, alert: 'Successfully left the course!'
    end
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
      @course.current_week = @course.weeks.create number: 0, max_points: 0, code_review: false

      (1..@course.week_count.to_i).each do |number|
        @course.weeks.create number:number, max_points: 3, code_review: false
      end

      @course.default_codereview_group  = @course.codereview_groups.create name:'Default group'

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
