class Professor < ActiveRecord::Base
  has_and_belongs_to_many :lectures
  validates :first_name, :last_name, presence: true, allow_blank: false
end
