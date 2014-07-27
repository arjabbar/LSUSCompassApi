class LectureDetailsLoader < Loader
  attr_accessor :lectures

  def load!
    begin
      Course.transaction { load_lecture_details }
    rescue ActiveRecord::Rollback => ex
      errors << ex
    end
  end

  def load_lecture_details
    lectures.map do |lecture|
      retreiver = Retreivers::LectureDetails.new url: lecture.details_url
      load_course_details(course: lecture.course, retreiver: retreiver)
    end
  end

  def lectures
    Lecture.all
  end

  def load_course_details(course:, retreiver:)
    puts "Loading details for #{course.code.green}"
    course.description    =  retreiver.course_description
    course.book_url  =  retreiver.text_book_url
    course.save
  end

  def get_page url
    browser.get url
  end

  def browser
    @browser ||= Mechanize.new
  end
  
end