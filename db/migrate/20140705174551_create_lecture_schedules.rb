class CreateLectureSchedules < ActiveRecord::Migration
  def change
    create_table :lecture_schedules do |t|
      t.references :schedule, index: true
      t.references :lecture, index: true

      t.timestamps
    end
  end
end
