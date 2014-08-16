module API::V1
  class CoursesController < APIController
    def index
      render json: Course.all, each_serializer: API::V1::CourseSerializer
    end
  end
end
