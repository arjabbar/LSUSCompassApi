module Parsers
  class Base
    attr_accessor :node
    delegate :[], to: :node, allow_nil: true

    def initialize node
      @node = node
    end

    def text
      @text ||= node.text.strip.gsub(/\s{2,}/, ' ')
    end

    def value
      value_attribute = node.attribute('value')
      value_attribute.value if value_attribute
    end

  end
end