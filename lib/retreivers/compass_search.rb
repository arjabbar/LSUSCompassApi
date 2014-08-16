module Retreivers
  class CompassSearch < Base
    attr_accessor :search_result_page_collection
    delegate :page, :current_page, :visited?, to: :@mechanize

    def initialize
      super
      @search_result_pages = []
    end

    def available(key)
      raise "There isn't a selector defined for key #{key}" unless key.in? available_keys 
      scraper.find key
    end

    def available_terms
      available(:terms)
    end

    def term_values
      available_terms.map(&:value)
    end

    def term_parsers
      self.available :terms
    end

    def available_keys
      Scrapers::CompassSearch::SELECTORS.keys
    end

    def search_all_lectures
      term_values.map { |term| search_lectures term: term }
    end

    def search_lectures(term: term)
      reset_other_form_fields
      search_form.term = term
      create_page_collection(first_page: search_form.submit)
    end

    def create_page_collection(first_page:)
      @search_result_page_collection = SearchResultPageCollection.new(first_result_page: first_page)
      @search_result_page_collection.grab_all_search_results
      @search_result_page_collection
    end

    def home_page
      @home_page ||= browser.get Settings::COMPASS_HOME
    end

    private

    def search_form
      home_page.form_with name: 'search'
    end

    def reset_other_form_fields
      search_form.delivery = ''
    end

    alias_method :find, :available
  end
end