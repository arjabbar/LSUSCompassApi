module Scrapers
  class SearchResultPage < Base

    SELECTORS = {
      num_results: 'h3:contains(Found)',
      next_page_button: '[value="Next Page"]',
      search_results: 'div[align=center]:last-child'
    }
  end
end