class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :term
  has_many :lecture_professors, class_name: LectureProfessors, foreign_key: :reference_number, primary_key: :reference_number
  has_many :professors, through: :lecture_professors
  has_many :schedules, dependent: :destroy
  validates :reference_number, presence: true, allow_blank: false

  before_save :set_term

  default_scope                                    { with_professors_and_courses }
  scope :with_professors_and_courses,   ->         { joins :professors, :course }
  scope :with_course_code_like,         -> (query) { where 'courses.code ILIKE ?', "%#{query}%" }
  scope :with_professor_like,           -> (query) { where 'professors.first_name ILIKE ? OR professors.last_name ILIKE ?', "%#{query}%", "%#{query}%" }
  scope :with_course_or_professor_like, -> (query) { where 'courses.code ILIKE ? OR professors.first_name ILIKE ? OR professors.last_name ILIKE ?', "%#{query}%", "%#{query}%", "%#{query}%" }

  def covered_term
    Term.all.find do |term|
      schedules.any? do |schedule|
        term.covers? schedule.start_date
      end
    end
  end

  private

  def set_term
    self.term = covered_term
  end
end
