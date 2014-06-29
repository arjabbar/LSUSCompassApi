require 'spec_helper'

describe Parsers::Lecture, type: :parser do
  
  let(:page) { TestFixtures.lecture_search_result_page }
  let(:scraper) { Scrapers::SearchResultPage.new page: page }
  let(:search_result) { scraper.scrape(:search_results).first }
  subject(:parser) { search_result.lecture_parsers.first }

  describe '#details_link' do
    its(:details_link) { should be_present }
  end

  describe '#reference_number' do
    its(:reference_number) { should be_present }
  end

  describe '#lecture_id' do
    its(:lecture_id) { should be_present }
  end

  describe '#campus' do
    its(:campus) { should be_present }
  end

  describe '#building_and_room' do
    its(:building_and_room) { should be_present }
  end

  describe '#building' do
    its(:building) { should be_present }
  end

  describe '#room' do
    its(:room) { should be_present }
  end

  describe '#session' do
    its(:session) { should be_present }
  end

  describe '#start_date' do
    its(:start_date) { should be_present }
  end

  describe '#end_date' do
    its(:end_date) { should be_present }
  end

  describe '#start_time' do
    its(:start_time) { should be_present }
  end

  describe '#end_time' do
    its(:end_time) { should be_present }
  end

  describe '#days_of_the_week' do
    its(:days_of_the_week) { should be_present }
  end

  describe '#seats_left' do
    its(:seats_left) { should be_present }
  end

  describe '#professor' do
    its(:professor) { should be_present }
  end

  describe '#is_info_box?' do
    pending 'setup context for this guy'
  end

  describe '#is_special_designator?' do
    pending 'setup context for this guy'
  end

  describe '#days_tba?' do
    pending 'setup context for this guy'
  end

end