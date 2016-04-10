class Course < ActiveRecord::Base

  has_many :weeks
  has_one :current_week, class_name: 'Week'

  has_many :codereview_groups

  has_many :participations
  has_many :student_participations, -> { where teacher: [nil, false] }, class_name: 'Participation'
  has_many :teacher_participations, -> { where teacher: true }, class_name: 'Participation'

  has_many :users, through: :participations
  has_many :students, through: :student_participations, class_name: 'User'
  has_many :teachers, through: :teacher_participations, class_name: 'User'

  belongs_to :leader, foreign_key: 'leader_id', class_name: 'User'

  scope :active, -> { where active:true }
  scope :finished, -> { where active:[nil, false] }

end
