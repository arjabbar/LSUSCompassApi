class RemoveForeignKeyOnLectureProfessors < ActiveRecord::Migration
  def change
    remove_column :lectures_professors, :lecture_id
    add_column :lectures_professors, :reference_number, :string
    add_index :lectures_professors, :reference_number
  end
end
