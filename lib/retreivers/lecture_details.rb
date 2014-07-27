module Retreivers
  class LectureDetails
    def initialize(url:)
      @url = url
      @url = "#{Settings::COMPASS_ROOT_URL}#{url}" unless Settings::COMPASS_ROOT_URL.in? url
    end

    def course_description
      course_description_parser.try :text
    end

    def course_description_parser
      course_description_parsers.first
    end

    def course_description_parsers
      scraper.scrape :course_description
    end

    def text_book_url
      course_text_book_url_parser.url
    end

    def course_text_book_url_parser
      course_text_book_url_parsers.first
    end

    def course_text_book_url_parsers
      scraper.scrape :text_book_url
    end

    def page
      @page ||= load_page @url
    end

    private

    def scraper
      @scraper ||= Scrapers::LectureDetails.new page: page
    end

    def load_page url
      browser.get url
    end

    def browser
      @mech ||= Mechanize.new
    end
  end
end