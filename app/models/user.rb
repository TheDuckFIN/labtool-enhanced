class User < ActiveRecord::Base
  has_secure_password

  has_many :courses, through: :participations

  validates :username, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }
  validates :password, length: { minimum: 8 }
  validates :email, presence: true

end
