class DayOfTheWeek < ActiveRecord::Base
  validates :name, presence: true, allow_blank: false, inclusion: { in: Date::DAYNAMES }
end
