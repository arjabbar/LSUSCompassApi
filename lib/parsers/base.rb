module Parsers
  class Base
    
    attr_accessor :node
    
    def initialize node
      @node = node
    end

    def text
      @text ||= node.text.strip
    end
  end
end