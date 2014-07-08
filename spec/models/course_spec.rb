require 'spec_helper'

describe Course do
  describe "it's validations" do
    it { should have_many :lectures }
    it { should validate_presence_of :code }
    it { should validate_uniqueness_of(:code) }
  end
end
