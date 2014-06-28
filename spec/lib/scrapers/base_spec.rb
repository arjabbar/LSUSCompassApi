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

  describe '#selectors' do
    before do
      stub_const 'Scrapers::Base::SELECTORS', selectors
    end
    it "should return the SELECTORS constant defined for that class" do
      expect(scraper.selectors).to eq scraper.class::SELECTORS
    end
  end

  describe "#node_for" do
    let(:page) { TestFixtures.compass_search_home_page }
    let(:selector_key) { :body }
    let(:selectors) { {selector_key => element_selector} }
    
    before do
      expect(scraper).to receive(:page).and_return page
    end
    
    subject(:nodes){ scraper.nodes_for selector_key }
    
    context "when the selector is found" do
      let(:element_selector) { 'body' }
      it { should_not be_empty }
      its(:first) { should be_a Nokogiri::XML::Element }
    end

    context "when the selector is NOT found" do
      let(:element_selector) { 'some_random_selector' }
      it { should be_empty }
    end
  end

  describe "#parser_class_for" do
    let(:parser_key) { :tests }
    context "when the parser is found" do
      let(:expected_parser_class) { Parsers::Test }
      before { stub_const "Parsers::Test", Class.new }
      it "should return a parser class" do
        parser_class = scraper.parser_class_for parser_key
        expect(parser_class).to be expected_parser_class
      end
    end
    context "when a parser isn't found" do
      it "should throw an error" do
        expect{scraper.parser_class_for parser_key}.to raise_error
      end
    end
  end

end