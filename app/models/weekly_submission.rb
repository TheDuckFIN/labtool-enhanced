class WeeklySubmission < ActiveRecord::Base

  belongs_to :participation
  belongs_to :week

end
