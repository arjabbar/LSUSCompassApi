require 'spec_helper'

describe Parsers::LectureDetails do

  let(:node)    { TestFixtures::LECTURE_DETAILS_ROW }
  let(:parser)  { Parsers::LectureDetails.new node }

  describe '#details_link' do
    subject { parser.details_link }
    it { should be_present }
  end

  describe '#reference_number' do
    subject { parser.reference_number }
    it { should be_present }
  end

  describe '#course_code' do
    subject { parser.course_code }
    it { should be_present }
  end

  describe '#campus' do
    subject { parser.reference_number }
    it { should be_present }
  end

  describe '#building_and_room' do
    subject { parser.building_and_room }
    it { should be_present }
  end

  describe '#building' do
    subject { parser.building }
    it { should be_present }
    it { should be_in parser.building_and_room }
  end

  describe '#room' do
    subject { parser.room }
    it { should be_present }
    it { should be_in parser.building_and_room }
  end

  describe '#session' do
    subject { parser.session }
    it { should be_present }
  end

  describe '#start_date' do
    subject { parser.start_date }
    it { should be_present }
    it { should be_a Date }
  end

  describe '#end_date' do
    subject { parser.end_date }
    it { should be_present }
    it { should be_a Date }
  end

  describe '#start_time' do
    subject { parser.start_time }
    it { should be_present }
    it { should be_a Time }
  end

  describe '#end_time' do
    subject { parser.end_time }
    it { should be_present }
    it { should be_a Time }
  end

  describe '#days_of_the_week' do
    subject { parser.days_of_the_week }
    it { should be_present }
    it { should be_an Array }
  end

  describe '#seats_left' do
    subject { parser.seats_left }
    it { should be_present }
  end

  describe '#professor' do
    subject { parser.professor }
    it { should be_present }
  end

  describe '#professor_first_name' do
    subject { parser.professor_first_name }
    it { should be_present }
    it { should be_in parser.professor }
  end

  describe '#professor_last_name' do
    subject { parser.professor_last_name }
    it { should be_present }
    it { should be_in parser.professor }
  end

  describe '#is_valid_lecture?' do
    subject { parser.is_valid_lecture? }
    it { should be_true }
  end

  describe '#is_info_only?' do
    subject { parser.is_info_only? }
    it { should be_false }
  end

  describe '#is_schedule_only?' do
    subject { parser.is_schedule_only? }
    it { should be_false }
  end

  describe '#is_special_designator?' do
    subject { parser.is_special_designator? }
    it { should be_false }
  end

  describe '#days_tba?' do
    subject { parser.days_tba? }
    it { should be_false }
  end

end
