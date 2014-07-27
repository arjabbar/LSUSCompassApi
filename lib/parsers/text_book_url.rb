module Parsers
  class TextBookUrl < Base
    def url
      node[:href]
    end
  end
end