module Parsers
  class Professor < Base

    def name
      find_node_text '.profName'
    end

    def first_name
      name.split(',').last.strip
    end

    def last_name
      name.split(',').first.strip
    end

    def department
      find_node_text '.profDept'
    end

    def total_ratings
      find_node_text('.profRatings').to_i
    end

    def average_rating
      find_node_text('.profAvg').to_f
    end

    def average_easiness_rating
      find_node_text('.profEasy').to_f
    end

    def is_hot?
      !(/notHot/i === search('.profHot').first[:class])
    end

    def profile_url
      "#{Settings::RATE_MY_PROFESSOR_ROOT_URL}/" + find_node('.profPhoto a')[:href]
    end

    def image_url
      find_node('.profPhoto img')[:src]
    end

    private

    def find_node selector
      search(selector)[0]
    end

    def find_node_text selector
      find_node(selector).text.strip
    end

  end
end