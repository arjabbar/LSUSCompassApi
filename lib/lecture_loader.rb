class LectureLoader
  attr_accessor :errored_entities
  def initialize
    @errored_entities = []
  end

  def load!
    puts "Loading compass search results".green
    retreiver = Retreivers::CompassSearch.new
    result_page_collections = retreiver.search_all_lectures
    result_page_collections.each do |page_collection|
      load_page_collection page_collection
    end
  end

  def load_page_collection page_collection
    page_collection.each do |search_result_page|
      search_result_parser = search_result_page.search_result
      lecture_parsers = search_result_parser.lecture_parsers
      lecture_parsers.select(&:is_valid_lecture?).each do |lecture|
        load_lecture lecture
      end
    end
  end

  def load_lecture lecture_parser
    begin
      load_entity Lecture,
        building: lecture_parser.building,
        room: lecture_parser.room,
        details_url: lecture_parser.details_link,
        reference_number: lecture_parser.reference_number,
        course: Course.find_or_create_by(code: lecture_parser.course_code),
        campus: lecture_parser.campus,
        session: lecture_parser.session,
        start_date: lecture_parser.start_date,
        end_date: lecture_parser.end_date,
        start_time: lecture_parser.start_time,
        end_time: lecture_parser.end_time
    rescue
      binding.pry
    end
  end

  def load_entity entity_class, attrtibutes
    puts "Loading #{entity_class}".blue
    entity = entity_class.new attrtibutes
    errored_entities << entity unless entity.save
  end
end
