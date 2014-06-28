module Parsers
  class Term < Base
    DATE_REGEX = /\d{2}\/\d{2}\/\d{2}/
    DATE_FORMAT = '%m/%d/%Y'

    def term_id
      @term_id ||= node.values.first
    end

    def description
      text.split(':').first.strip
    end

    def from_date
      Date.strptime dates.first, DATE_FORMAT
    end

    def to_date
      Date.strptime dates.last, DATE_FORMAT
    end

    private

    def dates
      @dates ||= text.scan DATE_REGEX
    end
  end
end