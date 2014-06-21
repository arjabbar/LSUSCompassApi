module Scrapers
  class Base
    attr_accessor :page, :selectors
    def initialize(page: page)
      @page = page
    end

    def scrape selector
      page.search(selectors[selector])
      .map do |node|
        parser_class_name = selector.to_s.singularize.camelize
        parser_class = "Parsers::#{parser_class_name}".safe_constantize
        raise "There isn't a parser for #{parser_class_name}" if parser_class.blank?
        parser_class.new node
      end
    end

    def selectors
      self.class::SELECTORS
    end

    alias_method :find, :scrape
  end
end