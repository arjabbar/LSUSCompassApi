module API::V1
  class LecturesController < APIController
    def index
      render json: filtered_lectures, each_serializer: API::V1::LectureSerializer
    end

    private

    def filtered_lectures
      lectures.with_course_or_professor_like search_query
    end

    def lectures
      term.lectures
    end

    def term
      Term.find_by id: term_id
    end

    def term_id
      params.require(:term_id)
    end

    def search_query
      params[:query]
    end
  end
end
