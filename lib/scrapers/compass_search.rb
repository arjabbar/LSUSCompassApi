module Scrapers
  class CompassSearch < Base

    SELECTORS = {
      terms: '[name=term] option',
      sessions: '[name=session] option',
      campuses: '[name=campus] option',
      class_statuses: '[name=classStatus] option'
    }
  end
end