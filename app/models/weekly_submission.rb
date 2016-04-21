class WeeklySubmission < ActiveRecord::Base

  belongs_to :participation
  belongs_to :week

  def to_s
    self.points.to_s
  end

end
