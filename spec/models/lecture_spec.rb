require 'spec_helper'

describe Lecture do
  describe "it's validations" do
    it { should validate_presence_of(:reference_number) }
  end

  describe "covered_term" do
    let(:schedules) { double 'Schedules' }
    let(:lecture) { Lecture.new }
    let(:term) { mock_model Term }
    let(:terms) { [term] }

    before do
      expect(Term).to receive(:all).and_return terms
      expect(lecture).to receive(:schedules).and_return schedules
    end
    
    context "when there exists a term that covers the lecture's range" do
      before do
        expect(schedules).to receive(:any?).and_return true
      end
      it "returns that term" do
        expect(lecture.covered_term).to be term
      end
    end
    
    context "when there does not exist a term that covers the lecture's range" do
      before do
        expect(schedules).to receive(:any?).and_return false
      end
      it "returns nil" do
        expect(lecture.covered_term).to be nil
      end
    end
  end

  describe "it's callbacks" do
    let(:callbacks){ Lecture._save_callbacks }
    describe "#before_save" do
      let(:before_save_callbacks) { callbacks.select{ |callback| callback.kind == :before } }
      subject { before_save_callbacks.map(&:filter) }
      it { should include :set_term }
    end
  end
end
