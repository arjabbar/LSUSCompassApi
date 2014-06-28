require 'spec_helper'

describe Parsers::Term, type: :parser do

  let(:page) { TestFixtures.compass_search_home_page }
  let(:scraper) { Scrapers::CompassHome.new page: page }
  subject(:parser) { scraper.scrape(:terms).first }

  describe '#term_id' do
    its(:term_id) { should be_present }
  end

  describe '#description' do
    its(:description) { should be_present }
  end

  describe '#from_date' do
    its(:from_date) { should be_present }
    its(:from_date) { should be_a Date }
  end

  describe '#to_date' do
    its(:to_date) { should be_present }
    its(:to_date) { should be_a Date }
  end

end
