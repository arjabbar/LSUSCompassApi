module Parsers
  class SearchResult < Base
    TOTAL_COURSES_REGEX = /\d{1,}/
    TOTAL_COURSES_SELECTOR = 'h3:contains("Found")'
    COURSE_ROW_SELECTOR = 'tr[id]'
    def total_courses
      total_courses_node = node.search(TOTAL_COURSES_SELECTOR).first
      total_coureses_text = total_courses_node.text.match(TOTAL_COURSES_REGEX).to_s
      total_coureses_text.to_i
    end

    def course_parsers
      node.search(COURSE_ROW_SELECTOR).map do |child_node|
        Course.new child_node
      end
    end
  end
end
