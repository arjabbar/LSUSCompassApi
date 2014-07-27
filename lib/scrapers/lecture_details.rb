module Scrapers
  class LectureDetails < Base
    SELECTORS = {
      course_description: 'td.fccsc-heading-s-black-normal:contains("hours")',
      text_book_url: 'a[href*="bookstore"]'
    }
  end
end