module Retreivers
  class CompassSearch
    attr_reader :home_page
    attr_accessor :search_result_page_collection
    delegate :page, :current_page, :visited?, to: :@mechanize
    delegate :term=, :delivery=, to: :search_form

    def initialize
      super
      @mechanize = Mechanize.new
      @home_page = @mechanize.get Settings::COMPASS_HOME
      @search_result_pages = []
    end

    def available(key)
      raise "There isn't a selector defined for key #{key}" unless key.in? available_keys 
      scraper.find key
    end

    def term_values
      available(:terms).map(&:value)
    end

    def available_keys
      Scrapers::CompassSearch::SELECTORS.keys
    end

    def search_all_lectures
      available_terms.map { |term| search_lectures term: term }
    end

    def search_lectures(term: term)
      reset_other_form_fields
      self.term = term
      create_page_collection(first_page: search_form.submit)
    end

    def create_page_collection(first_page:)
      @search_result_page_collection = SearchResultPageCollection.new(first_result_page: first_page)
      @search_result_page_collection.grab_all_search_results
      @search_result_page_collection
    end

    private

    def scraper
      @scraper ||= Scrapers::CompassSearch.new(page: home_page)
    end

    def search_form
      home_page.form_with name: 'search'
    end

    def reset_other_form_fields
      self.delivery = ''
    end

    alias_method :available_terms, :term_values
    alias_method :find, :available
  end
end