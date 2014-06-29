class CreateDayOfTheWeeks < ActiveRecord::Migration
  def change
    create_table :day_of_the_weeks do |t|
      t.string :name

      t.timestamps
    end
  end
end
