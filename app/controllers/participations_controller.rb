class ParticipationsController < ApplicationController
  before_action :set_participation, only: :destroy
  before_action :ensure_that_logged_in

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    @participation.active = true

    if @participation.save
      redirect_to @participation.course, notice:'Welcome to course!'
    else
      @course = @participation.course
      render 'courses/join'
    end
  end

  def destroy
    if @participation and (@participation.user == current_user or current_user.admin?)
      @participation.destroy
      redirect_to :back, notice: @participation.teacher? ? 'Teacher removed successfully!' : 'Successfully left the course!'
    end
  end

  def update

  end

  private

    def participation_params
      params.require(:participation).permit(:course_id, :codereview_group_id, :repository, :topic)
    end

    def set_participation
      @participation = Participation.find(params[:id])
    end

end
