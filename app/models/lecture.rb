class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :term
  has_and_belongs_to_many :professors, foreign_key: :reference_number
  has_many :schedules, dependent: :destroy
  validates :reference_number, presence: true, allow_blank: false

  before_save :set_term

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
