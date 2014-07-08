class RemoveScheduleFromLectures < ActiveRecord::Migration
  def up
    remove_column :lectures, :start_time
    remove_column :lectures, :end_time
    remove_column :lectures, :start_date
    remove_column :lectures, :end_date
  end
  def down
    add_column :lectures, :start_time, :time
    add_column :lectures, :end_time, :time
    add_column :lectures, :start_date, :date
    add_column :lectures, :end_date, :date
  end
end
