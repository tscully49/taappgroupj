class Professor < ActiveRecord::Base
  has_many :courses
  before_save { self.miz_email = miz_email.downcase }
  validates :prof_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w]+@missouri\.edu\Z/i
  validates :miz_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  #validates :password_digest, length: { minimum: 6 }
  
end