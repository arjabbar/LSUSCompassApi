class RenameLectureProfessorsToLecturesProfessors < ActiveRecord::Migration
  def change
    rename_table :lecture_professors, :lectures_professors
  end
end
