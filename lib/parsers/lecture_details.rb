module Parsers
  class LectureDetails < Base
    DATE_FORMAT = '%m/%d/%y'
    TIME_FORMAT = '%H:%M %p'
    DATE_REGEX = /\d{2}\/\d{2}\/\d{2}/
    DAY_OF_THE_WEEK_MAPPINGS =
    {
      'M' => 'Monday',
      'T' => 'Tuesday',
      'W' => 'Wednesday',
      'R' => 'Thursday',
      'F' => 'Friday'
    }

    def details_link
      node.search('a').first['href']
    end

    def reference_number
      node['id']
    end

    def course_code
      table_cells[2].text
    end

    def campus
      table_cells[3].text
    end

    def building_and_room
      table_cells[4].text
    end

    def building
      table_cells[4].text.split('/').first
    end

    def room
      table_cells[4].text.split('/').last
    end

    def session
      table_cells[5].text
    end

    def start_date
      date_string = start_date_node.text
      parse_date date_string
    end

    def end_date
      date_string = end_date_node.text
      parse_date date_string
    end

    def start_time
      time_string = start_time_node.text
      parse_time time_string
    end

    def end_time
      time_string = end_time_node.text
      parse_time time_string
    end

    def days_of_the_week
      return if days_tba?
      @days_of_the_week ||= 
      days_of_the_week_nodes
      .map do |cell|
        day_of_the_week_letter = cell.text.gsub /[[:space:]]/, ''
        DAY_OF_THE_WEEK_MAPPINGS[day_of_the_week_letter]
      end
    end

    def seats_left
      table_cells[18].text.to_i
    end

    def professor
      table_cells[19].text
    end

    def professor_first_name
      professor.split(',').last.strip if professor.present?
    end

    def professor_last_name
      professor.split(',').first.strip if professor.present?
    end

    def is_valid_lecture?
      !is_info_only? && !is_special_designator? && !is_schedule_only?
    end

    def is_info_only?
      contains_selector? '.infobox'
    end

    def is_schedule_only?
      !contains_a_link? && contains_a_date?
    end

    def is_special_designator?
      contains_selector? '[class*=red]'
    end

    def days_tba?
      table_cells[11].text.match(/T/).present?
    end

    private

    def contains_a_link?
      node.search('a').present?
    end

    def contains_selector? selector
      node.search(selector).present?
    end

    def contains_a_date?
      DATE_REGEX === node.text
    end

    def start_date_node
      table_cells[is_schedule_only? ? 3 : 6]
    end

    def end_date_node
      table_cells[is_schedule_only? ? 4 : 7]
    end

    def start_time_node
      table_cells[is_schedule_only? ? 5 : 8]
    end

    def end_time_node
      table_cells[is_schedule_only? ? 7 : 10]
    end

    def days_of_the_week_nodes
      table_cells[is_schedule_only? ? (8..14) : (11..17)]
    end

    def table_cells
      node.search('td')
    end

    def parse_date str
      Date.strptime str, DATE_FORMAT rescue nil
    end

    def parse_time str
      Time.strptime str, TIME_FORMAT rescue nil
    end

  end
end
