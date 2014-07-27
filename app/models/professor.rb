class Professor < ActiveRecord::Base
  has_and_belongs_to_many :lectures
  validates :first_name, :last_name, presence: true, allow_blank: false

  scope :with_a_name_like, -> (name) { where 'first_name ILIKE ? OR last_name ILIKE ?', "%#{name}%", "%#{name}%" }
end
