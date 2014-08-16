module Retreivers
  class Base

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

    def check_for_matching_scraper!
      raise "There isn't a scraper matching to #{scraper_class_name} that the retreiver #{self.class} can use." if scraper_class.nil?
    end
  end
end
