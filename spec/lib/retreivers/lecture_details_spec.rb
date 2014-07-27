require 'spec_helper'

describe Retreivers::LectureDetails do
  let(:page)      { TestFixtures.lecture_details_page }
  let(:retreiver) { Retreivers::LectureDetails.new url: 'test' }

  before do
    expect(retreiver).to receive(:page).and_return page
  end

  describe "#course_description_parser" do
    subject { retreiver.course_description_parser }
    it      { should be_a Parsers::CourseDescription }
  end

  describe "#course_text_book_url_parser" do
    subject { retreiver.course_text_book_url_parser }
    it      { should be_a Parsers::TextBookUrl }
  end


end