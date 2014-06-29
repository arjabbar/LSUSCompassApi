class AddDaysOfTheWeek < ActiveRecord::Migration
  def change
    %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday).each do |day_of_the_week|
      DayOfTheWeek.create name: day_of_the_week
    end
  end
end
