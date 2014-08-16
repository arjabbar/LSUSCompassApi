module Retreivers
  class RateMyProfessorSearch < Base
    attr_reader :search_url
    def initialize
      @search_url = "#{Settings::RATE_MY_PROFESSOR_PROFESSOR_SEARCH_URL}?sid=#{Settings::RATE_MY_PROFESSOR_SCHOOL_ID}"
    end

    def get_page page_number
      load_page url_for_page(page_number)
    end

    def pages
      retreivered_pages.values
    end

    private

    def load_page url
      retreivered_pages[url] ||= browser.get(url)
    end

    def retreivered_pages
      @retreivered_pages ||= {}
    end

    def url_for_page page_number
      "#{search_url}&pageNo=#{page_number}"
    end
  end
end