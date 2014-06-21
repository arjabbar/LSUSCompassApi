require 'spec_helper'

describe Retreivers::CompassSearch, type: :retreiver do
  let(:retreiver) { described_class.new } 
  describe '#available' do
    let(:scraper) { double "Scraper" }
    let(:key) { :test }
    before do
      expect(retreiver).to receive(:scraper).and_return scraper
      expect(retreiver).to receive(:available_keys).and_return available_keys
    end
    context 'when the key supplied is in the list of available keys' do
      let(:available_keys) { [:test] }
      it "passes the key to it's scraper" do
        expect(scraper).to receive(:find).with key
        retreiver.available key
      end 
    end
  end

end
