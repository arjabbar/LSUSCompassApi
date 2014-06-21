require 'spec_helper'

describe Parsers::Base, type: :parser do
  let(:node) { double text: node_text } 
  let(:parser) { Parsers::Base.new node } 
  let(:node_text) { '' } 
  describe '#text' do
    let(:node_text) { "\n\r  Some string with whitespace   \n" }
    subject { parser }
    its(:text) { should eq node_text.strip }
  end

end