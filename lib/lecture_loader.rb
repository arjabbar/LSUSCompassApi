class LectureLoader < Loader

  def retreiver
    @retreiver ||= Retreivers::CompassSearch.new
  end

  def load_terms!
    retreiver.available_terms.each do |term_parser|
      load_term term_parser: term_parser
    end
  end

  def load!
    puts "Loading compass search results".green
    load_terms!
    result_page_collections = retreiver.search_all_lectures
    result_page_collections.each do |collection|
      load_page_collection(page_collection: collection)
    end
  end

  def load_term(term_parser:)
    term = Term.find_or_initialize_by dom_value: term_parser.dom_value
    term.assign_attributes start_date: term_parser.start_date,
      end_date: term_parser.end_date,
      description: term_parser.description
    errors << term unless term.save
    term
  end

  def load_page_collection(page_collection:)
    page_collection.each do |search_result_page|
      load_search_result_page(page: search_result_page)
    end
  end

  def load_search_result_page(page:)
    search_result_parser = page.search_result
    lecture_parsers = search_result_parser.lecture_parsers
    lecture_parsers.each do |lecture_parser|
      begin
        load_lecture_details lecture_parser: lecture_parser
      rescue ActiveRecord::Rollback => ex
        errors << ex
      end
    end
  end

  def load_lecture_details(lecture_parser:)
    if lecture_parser.is_valid_lecture?
      load_lecture lecture_parser: lecture_parser
    elsif lecture_parser.is_schedule_only?
      load_lecture_schedule lecture_parser: lecture_parser
    end
  end

  def load_lecture(lecture_parser:)
    Lecture.transaction do
      lecture = Lecture.find_or_initialize_by reference_number: lecture_parser.reference_number

      lecture.schedules.destroy_all

      lecture.assign_attributes building: lecture_parser.building,
        room:             lecture_parser.room,
        details_url:      lecture_parser.details_link,
        reference_number: lecture_parser.reference_number,
        course:           Course.find_or_create_by(code: lecture_parser.course_code),
        campus:           lecture_parser.campus,
        session:          lecture_parser.session,
        seats_left:       lecture_parser.seats_left

      load_lecture_professor lecture: lecture,
        first_name: lecture_parser.professor_first_name,
        last_name: lecture_parser.professor_last_name

      load_lecture_schedule lecture: lecture,
        lecture_parser: lecture_parser

      lecture.save
    end
  end

  def load_lecture_schedule(lecture: nil, lecture_parser:)
    Schedule.transaction do
      lecture ||= Lecture.find_or_create_by reference_number: lecture_parser.reference_number
      schedule = Schedule
      .new(start_time: lecture_parser.start_time,
           end_time: lecture_parser.end_time,
           start_date: lecture_parser.start_date,
           end_date: lecture_parser.end_date)
      unless lecture_parser.days_tba?
        schedule.day_of_the_weeks = DayOfTheWeek.where(name: lecture_parser.days_of_the_week)
      end
      lecture.schedules << schedule
    end
  end

  def load_lecture_professor(lecture:, first_name:, last_name:)
    professor = Professor
    .find_or_create_by(first_name: first_name,
                       last_name: last_name)
    lecture.professors << professor if professor.valid?
  end

end
