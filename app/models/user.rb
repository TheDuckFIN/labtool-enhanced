class User < ActiveRecord::Base

  has_secure_password

  has_many :participations

  has_many :courses, through: :participations
  has_many :own_courses, class_name: 'Course', foreign_key: 'leader_id'

  validates :username, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }
  validates :password, length: { minimum: 8 }
  validates :email, presence: true
  validates :student_number, format: { with: /\A0\d{8}\z/, message: 'is invalid (must be 9 digits and start with 0)' }

  def format_name(both)
    return self.username if self.realname.nil? || self.realname.empty?
    return "#{self.realname} (#{self.username})" if both
    self.realname
  end

  def is_teacher?(course)
    Participation.where(course:course, user:self, teacher:true).any?
  end

  def is_leader?(course)
    self == course.leader
  end

  def is_participant?(course)
    Participation.where(course:course, user:self, teacher:[nil, false]).any?
  end

  def points_for_course(course)
    points = Array.new
    participation = Participation.where user:self, course:course

    course.real_weeks.each do |week|
      submission = WeeklySubmission.where participation:participation, week:week

      if submission.any?
        points << "#{submission.first.points} / #{week.max_points}"
      else
        points << "- / #{week.max_points}"
      end
    end

    points
  end

end
