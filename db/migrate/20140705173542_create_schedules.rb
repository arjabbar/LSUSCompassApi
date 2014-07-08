class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :days_of_the_week, index: true
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
