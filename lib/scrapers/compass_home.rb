module Scrapers
  class CompassHome
    attr_accessor :page
    def initialize(page: page)
      @page = page
    end

    def scrape selector
      page.search(SELECTORS[selector])
      .map do |node|
        parser_class_name = selector.to_s.singularize.titleize
        parser_class = "Parsers::#{parser_class_name}".safe_constantize
        raise "There isn't a parser for #{parser_class_name}" if parser_class.blank?
        parser_class.new node
      end
    end

    SELECTORS = {
      terms: '[name=term] option',
      sessions: '[name=session] option',
      campuses: '[name=campus] option'
    }
  end
end