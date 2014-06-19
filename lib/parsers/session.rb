module Parsers
  class Session < Base
    
    def session_id
      value_attribute = node.attribute('value')
      value_attribute.value if value_attribute
    end
    alias_method :text, :description
  end
end