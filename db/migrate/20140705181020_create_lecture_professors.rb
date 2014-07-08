class CreateLectureProfessors < ActiveRecord::Migration
  def change
    create_table :lecture_professors do |t|
      t.references :lecture, index: true
      t.references :professor, index: true

      t.timestamps
    end
  end
end
