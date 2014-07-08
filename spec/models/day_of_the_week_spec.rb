require 'spec_helper'

describe DayOfTheWeek do
  describe "it's validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_inclusion_of(:name).in_array Date::DAYNAMES }
  end
end
