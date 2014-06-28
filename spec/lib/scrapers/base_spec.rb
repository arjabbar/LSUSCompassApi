require 'spec_helper'

describe Scrapers::Base do
  
  let(:page) { double }
  let(:element_selector) { 'div' }
  let(:scraper) { described_class.new page: page }
  let(:selector_key) { :terms }
  let(:selectors) { { selector_key => element_selector } }
  let(:nodes) { [double] }

  before do
    scraper.stub(:selectors).and_return selectors
  end

  describe '#scrape' do
    before do
      expect(scraper).to receive(:nodes_for).with(selector_key).and_return nodes
    end
    it 'creates an array of parsers from the selector' do
      result = scraper.scrape selector_key
      expect(result.first).to be_a Parsers::Term
    end
  end

end