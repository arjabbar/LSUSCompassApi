class API::V1::CoursesController < ApplicationController
  def index
    render json: Course.all, each_serializer: API::V1::CourseSerializer
  end
end
