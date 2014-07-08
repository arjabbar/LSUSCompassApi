class ScheduleDay < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :day_of_the_week
end
