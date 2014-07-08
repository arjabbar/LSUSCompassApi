class Schedule < ActiveRecord::Base
  has_many :schedule_days, dependent: :destroy
  has_many :day_of_the_weeks, through: :schedule_days
  belongs_to :lecture
  validates :lecture_id, presence: true, allow_blank: false
end
