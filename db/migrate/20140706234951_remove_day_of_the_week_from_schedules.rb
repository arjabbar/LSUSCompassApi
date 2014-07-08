class RemoveDayOfTheWeekFromSchedules < ActiveRecord::Migration
  def change
    remove_reference :schedules, :days_of_the_week, index: true
  end
end
