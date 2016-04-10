class Course < ActiveRecord::Base

  attr_accessor :week_count

  has_many :weeks, dependent: :destroy
  has_one :current_week, class_name: 'Week'

  has_many :codereview_groups, dependent: :destroy
  has_one :default_codereview_group, class_name: 'CodereviewGroup'

  has_many :participations, dependent: :destroy
  has_many :student_participations, -> { where teacher: [nil, false] }, class_name: 'Participation'
  has_many :teacher_participations, -> { where teacher: true }, class_name: 'Participation'

  has_many :users, through: :participations
  has_many :students, through: :student_participations, class_name: 'User'
  has_many :teachers, through: :teacher_participations, class_name: 'User'

  belongs_to :leader, foreign_key: 'leader_id', class_name: 'User'

  scope :active, -> { where active:true }
  scope :finished, -> { where active:[nil, false] }

  validates :week_count, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :name, presence: true

end
