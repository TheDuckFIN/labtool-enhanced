class Course < ActiveRecord::Base

  has_many :users, through: :participations

end
