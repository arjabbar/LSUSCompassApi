module Scrapers
  class RateMyProfessorSearchResult < Base
    SELECTORS = {
      professors: '#ratingTable .entry'
    }
  end
end