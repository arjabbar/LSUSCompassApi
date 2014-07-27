require 'spec_helper'

describe Retreivers::CompassSearch, type: :retreiver do
  
  let(:retreiver) { Retreivers::CompassSearch.new }

  describe '#available' do
    let(:scraper) { double "Scraper" }
    let(:key)     { :test }
    before do
      retreiver.stub(:scraper).and_return scraper
      expect(retreiver).to receive(:available_keys).and_return available_keys
    end

    context 'when the key supplied is in the list of available keys' do
      let(:available_keys) { [:test] }
      it "passes the key to it's scraper" do
        expect(scraper).to receive(:find).with key
        retreiver.available key
      end
    end

    context 'when the key supplied is not in the list of available keys' do
      let(:available_keys) { [] }
      it 'raises an exception' do
        expect{retreiver.available key}.to raise_error
      end
    end

  end

end
