require 'spec_helper'

describe Schedule do
  describe "it's validations" do
    it { should validate_presence_of :lecture_id }
    it { should belong_to :lecture }
  end
end
