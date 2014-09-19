module Scrapers
  class RateMyProfessorSearch < Base
    SELECTORS = {
      rate_my_professor_paging: '[name=pagForm]'
    }
  end
end