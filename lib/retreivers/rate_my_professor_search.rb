module Retreivers
  class RateMyProfessorSearch < Base
    attr_reader :search_url
    
    def initialize
      @search_url = "#{Settings::RATE_MY_PROFESSOR_PROFESSOR_SEARCH_URL}?sid=#{Settings::RATE_MY_PROFESSOR_SCHOOL_ID}"
      browser.get @search_url
    end

    def get_page page_number
      load_page url_for_page(page_number)
    end

    def pages
      retreivered_pages.values
    end

    def retreivered_pages
      @retreivered_pages ||= {}
    end

    def search_result_retreivers
      load_all_pages! if pages.blank?
      pages.map do |page|
        RateMyProfessorSearchResult.new page: page
      end
    end

    def professor_parsers
      search_result_retreivers.map do |retreiver|
        retreiver.professor_parsers
      end.flatten
    end

    def load_all_pages!
      1.upto number_of_pages do |page_number|
        get_page page_number
      end
      retreivered_pages.values
    end

    def paging_parser
      scraper.scrape(:rate_my_professor_paging).first
    end

    private

    def load_page url
      retreivered_pages[url] ||= browser.get(url)
    end

    def url_for_page page_number
      "#{search_url}&pageNo=#{page_number}"
    end

    delegate :number_of_pages, to: :paging_parser, allow_nil: true

  end
end