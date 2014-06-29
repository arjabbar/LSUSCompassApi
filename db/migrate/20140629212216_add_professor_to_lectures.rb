class AddProfessorToLectures < ActiveRecord::Migration
  def change
    add_reference :lectures, :professor, index: true
  end
end
