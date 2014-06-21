module Parsers
  class CourseRow < Base
    DATE_FORMAT = '%m/%d/%Y'
    TIME_FORMAT = '%H:%M %p'

    def details_link
      node.search('a').first['href']
    end

    def reference_number
      node['id']
    end

    def course_id
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
      parse_date table_cells[6].text
    end

    def end_date
      parse_date table_cells[7].text
    end

    def start_time
      parse_time table_cells[8].text
    end

    def end_time
      parse_time table_cells[10].text
    end

    def days_of_the_week
      return @days_of_the_week if @days_on_the_week
      return (@days_of_the_week = nil) if days_tba?
      days_array = table_cells[11..17].map do |cell, index|
        cell.text.match('[A-Z]').present?
      end
      .zip(Date::DAYNAMES).flatten.reverse
      @days_of_the_week = Hash[*days_array].map{|k,v| [k.underscore.intern, v]}.to_h
    end

    def seats_left
      table_cells[18].text.to_i
    end

    def professor
      table_cells[19].text
    end

    def is_info_box?
      contains_selector? '.infobox'
    end

    def is_special_designator?
      contains_selector? '[class*=red]'
    end

    def days_tba?
      table_cells[11].text.match(/T/).present?
    end

    private

    def contains_selector? selector
      node.search(selector).present?
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
