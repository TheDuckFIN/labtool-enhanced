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

  def is_teacher(course)
    byebug
  end

end
