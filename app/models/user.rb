class User < ActiveRecord::Base
  has_one :application
  before_save { self.email = email.downcase }
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :student_id, presence: true, length: {maximum: 8, minimum: 8}
  VALID_EMAIL_REGEX = /\A[\w]+@mail\.missouri\.edu\Z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  #validates :password_digest, length: { minimum: 6 }
  
  end
