require 'spec_helper'

describe Parsers::Session, type: :parser do
  let(:node) { double text: node_text } 
  let(:parser) { Parsers::Session.new node } 
  let(:node_text) { '' } 
  describe '#session_id' do
    pending "Test me!"
  end

end