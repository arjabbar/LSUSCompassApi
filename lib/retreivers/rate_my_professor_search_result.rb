module Retreivers
  class RateMyProfessorSearchResult < Base
    def initialize(page: page)
      super()
      @page = page
    end

    def professor_parsers
      scraper.scrape :professors
    end
  end
end