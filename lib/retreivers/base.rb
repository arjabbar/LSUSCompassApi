module Retreivers
  class Base
    attr_reader :browser
    delegate :current_page, :visited?, to: :browser

    def initialize
      check_for_matching_scraper!
    end

    def browser
      @browser ||= Mechanize.new
    end

    def scraper
      @scraper ||= scraper_class.new page: page
    end

    def scraper_class
      scraper_class_name.safe_constantize
    end

    def scraper_class_name
      "Scrapers::#{self.class.to_s.demodulize}".freeze
    end

    private

    def page
      browser.page || @page
    end

    def check_for_matching_scraper!
      raise "There isn't a scraper matching to #{scraper_class_name} that the retreiver #{self.class} can use." unless scraper_class.present?
    end
  end
end
