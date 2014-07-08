class CreateScheduleDays < ActiveRecord::Migration
  def change
    create_table :schedule_days do |t|
      t.references :schedule, index: true
      t.references :day_of_the_week, index: true

      t.timestamps
    end
  end
end
