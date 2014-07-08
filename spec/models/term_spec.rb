require 'spec_helper'

describe Term do
  describe "it's validations" do
    it { should validate_presence_of(:dom_value) } 
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should have_many :lectures }
  end
end
