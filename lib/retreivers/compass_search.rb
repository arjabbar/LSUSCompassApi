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
      raise "There isn't a selector defined for key #{key}" unless available_keys.include? key 
      scraper.find key
    end

    def term_values
      available(:terms).map(&:value)
    end

    def available_keys
      Scrapers::CompassHome::SELECTORS.keys
    end

    def search_courses(term: term)
      term = term
      reset_other_form_fields
      @search_result_page_collection = SearchResultPageCollection.new(first_result_page: search_form.submit)
      @search_result_page_collection.grab_all_search_results
      @search_result_page_collection
    end

    def scraper
      @scraper ||= Scrapers::CompassHome.new(page: home_page)
    end

    private

    def search_form
      home_page.form_with name: 'search'
    end

    def reset_other_form_fields
      self.delivery = ''
    end

    alias_method :find, :available
  end
end