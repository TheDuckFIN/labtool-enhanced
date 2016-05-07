class WeeksController < ApplicationController
  before_action :set_week

  def edit

  end

  def update

  end

  private

    def set_week
      @week = Week.find_by id:params[:id]
    end

 end