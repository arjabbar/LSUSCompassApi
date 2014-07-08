class RemoveDaysOfTheWeekIdFromLectures < ActiveRecord::Migration
  def change
    remove_reference :lectures, :days_of_the_week, index: true
  end
end
