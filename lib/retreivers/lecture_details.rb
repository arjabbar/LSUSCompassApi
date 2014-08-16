module Retreivers
  class LectureDetails < Base
    def initialize(url:)
      super()
      @url = url
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

    def load_page url
      browser.get url
    end

  end
end