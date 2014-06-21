module Parsers
  class Session < Base
    alias_method :description, :text
  end
end