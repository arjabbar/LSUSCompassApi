class RemoveProfessorFromLectures < ActiveRecord::Migration
  def change
    remove_reference :lectures, :professor, index: true
  end
end
