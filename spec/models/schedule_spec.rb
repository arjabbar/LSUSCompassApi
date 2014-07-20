require 'spec_helper'

describe Schedule do
  describe "it's validations" do
    it { should belong_to :lecture }
  end
end
