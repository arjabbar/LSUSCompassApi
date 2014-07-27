module Parsers
  class CourseDescription < Base
    alias_method :description, :text
  end
end