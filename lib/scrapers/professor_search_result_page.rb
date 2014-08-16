module Scrapers
  class ProfessorSearchResultPage
    SELECTORS = {
      professors: '#ratingTable .entry',
      next_page_link: '#next',
      last_page_link: '#last',
      first_page_link: '[id*=first_]',
      back_page_link: '[id*=back_]'
    }
  end
end