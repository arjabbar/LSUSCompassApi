class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :term
  has_and_belongs_to_many :professors
  has_many :schedules, dependent: :destroy
  validates :reference_number, presence: true, allow_blank: false
end
