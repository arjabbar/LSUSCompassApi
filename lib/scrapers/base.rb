module Scrapers
  class Base
    attr_accessor :page, :selectors
    def initialize(page: page)
      @page = page
    end

    def scrape selector
      nodes_for(selector).map do |node|
        parser_class_for(selector).new node
      end
    end

    def selectors
      self.class::SELECTORS
    end

    def nodes_for selector
      page.search(selectors[selector])
    end

    def parser_class_for sym
      parser_class_name = sym.to_s.singularize.camelize
      parser_class = "Parsers::#{parser_class_name}".safe_constantize
      raise "There isn't a parser for #{parser_class_name}" unless parser_class.present?
      parser_class
    end

    alias_method :find, :scrape
  end
end
