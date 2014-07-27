class Term < ActiveRecord::Base
  validates :dom_value, :description, :start_date, :end_date, presence: true, allow_blank: false
  has_many :lectures

  def covers?(date)
    (start_date..end_date).cover? date
  end

end
