class Lecture < ActiveRecord::Base
  belongs_to :course
  has_one :professor
end
