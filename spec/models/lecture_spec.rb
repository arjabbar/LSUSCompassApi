require 'spec_helper'

describe Lecture do
  describe "it's validations" do
    it { should validate_presence_of(:reference_number) }
  end
end
