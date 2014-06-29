module Parsers
  class SearchResult < Base
    TOTAL_LECTURES_REGEX = /\d{1,}/
    TOTAL_LECTURES_SELECTOR = 'h3:contains("Found")'
    LECTURE_ROW_SELECTOR = 'tr[id]'
    def total_lectures
      total_lectures_node = node.search(TOTAL_LECTURES_SELECTOR).first
      total_coureses_text = total_lectures_node.text.match(TOTAL_LECTURES_REGEX).to_s
      total_coureses_text.to_i
    end

    def lecture_parsers
      node.search(LECTURE_ROW_SELECTOR).map do |child_node|
        Lecture.new child_node
      end
    end

    alias_method :lectures, :lecture_parsers
  end
end
