class User < ActiveRecord::Base

  has_secure_password

  has_many :participations
  has_many :courses, through: :participations
  has_many :active_courses, -> { where active: true }, through: :participations, class_name: 'Course'
  has_many :completed_courses, -> { where active: false }, through: :participations, class_name: 'Course'
  has_many :own_courses, -> { where leader: self.id }, through: :participations, class_name: 'Course'

  validates :username, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }
  validates :password, length: { minimum: 8 }
  validates :email, presence: true

  def format_name(both)
    return self.username if self.realname.nil? || self.realname.empty?
    return "#{self.realname} (#{self.username})" if both
    self.realname
  end

end
