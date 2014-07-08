class Course < ActiveRecord::Base
  has_many :lectures
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
