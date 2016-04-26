class ParticipationsController < ApplicationController
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
    participation = Participation.where course_id: params[:id], user: current_user

    if participation.any?
      participation.first.destroy
      redirect_to :back, notice: 'Successfully left course!'
    end
  end

  def update

  end

  private

    def participation_params
      params.require(:participation).permit(:course_id, :codereview_group_id, :repository, :topic)
    end

end
