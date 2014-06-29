class AddCourseToLectures < ActiveRecord::Migration
  def change
    add_reference :lectures, :course, index: true
  end
end
