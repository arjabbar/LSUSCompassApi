require 'spec_helper'

describe LectureProfessors do
  describe "it's validations" do
    it { should validate_presence_of :professor_id }
    it { should validate_presence_of :lecture_id }
    it { should belong_to :lecture }
    it { should belong_to :professor }
  end
end
