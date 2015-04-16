class Application < ActiveRecord::Base
  belongs_to :user
  has_many :application_courses
  has_many :courses, through: :application_courses
	before_save { self.mizzou_email = mizzou_email.downcase }
	validates :first_name,  presence: true, length: { maximum: 50 }
  	validates :last_name,  presence: true, length: { maximum: 50 }
  	validates :student_id,  presence: true, length: { maximum: 8, minimum: 8 }
  	validates :gpa,  presence: true, numericality: {less_than_or_equal_to: 4.00} #Make sure you validate that it is #.### three decimal places
  	VALID_PHONE_REGEX = /\A\d\d\d-\d\d\d-\d\d\d\d\z/i
  	validates :phone_num, presence: true, 
  					format: {with: VALID_PHONE_REGEX}
  	VALID_EMAIL_REGEX = /\A[\w]+@[mail]+\.[missouri]+\.[edu]+\z/i
  	validates :mizzou_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    #timestamp???
    #date of app??? or timestamp
    validates :anticipated_graduation_date, presence: true
    #speak score
    #semester of test
    #orientation met
    #accepted
    validates :position_applying_for, presence: true
    #undergrad status
    #grad status
    #advisor 
    #other work
    #international 1, 2, 3
end