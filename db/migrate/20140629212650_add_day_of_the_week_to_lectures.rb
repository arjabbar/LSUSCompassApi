class AddDayOfTheWeekToLectures < ActiveRecord::Migration
  def change
    add_reference :lectures, :days_of_the_week, index: true
  end
end
