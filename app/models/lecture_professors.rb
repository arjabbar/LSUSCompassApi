class LectureProfessors < ActiveRecord::Base
  self.table_name = 'lectures_professors'
  validates :lecture_id, :professor_id, presence: true, allow_blank: false
  validates :lecture_id, uniqueness: { scope: :professor_id }
  belongs_to :lecture
  belongs_to :professor
end
