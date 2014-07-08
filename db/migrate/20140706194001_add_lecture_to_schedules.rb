class AddLectureToSchedules < ActiveRecord::Migration
  def change
    add_reference :schedules, :lecture, index: true
  end
end
