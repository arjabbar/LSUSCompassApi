class RemoveLectureSchedule < ActiveRecord::Migration
  def change
    drop_table :lecture_schedules
  end
end
