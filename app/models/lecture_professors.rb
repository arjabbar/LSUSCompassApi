class LectureProfessors < ActiveRecord::Base
  self.table_name = 'lectures_professors'
  validates :reference_number, :professor_id, presence: true, allow_blank: false
  validates :reference_number, uniqueness: { scope: :professor_id }
  belongs_to :lecture
  belongs_to :professor
end
