module Parsers
  class Term
    DATE_REGEX = /\d{2}\/\d{2}\/\d{2}/
    attr_accessor :node
    def initialize node
      @node = node
    end

    def term_id
      @term_id ||= node.values.first
    end

    def text
      @text ||= node.text.strip
    end

    def description
      text.split(':').first.strip
    end

    def from_date
      dates.first
    end

    def to_date
      dates.last
    end

    private

    def dates
      @dates ||= text.scan DATE_REGEX
    end
  end
end