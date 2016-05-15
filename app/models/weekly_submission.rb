class WeeklySubmission < ActiveRecord::Base

  belongs_to :participation
  belongs_to :week

  validate :points_must_not_exceed_week_maximum
  validates :points, numericality: { greater_than_or_equal_to: 0 }


  def points_must_not_exceed_week_maximum
    if points > week.max_points
      errors.add(:points, "must not exceed week's maximum (#{week.max_points})")
    end
  end

end
