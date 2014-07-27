class API::V1::LecturesController < ApplicationController
  def index
    render json: lectures, each_serializer: API::V1::LectureSerializer
  end

  private

  def lectures
    return Lecture.all unless term
    term.lectures
  end

  def term
    Term.find_by id: lecture_params[:term_id]
  end

  def lecture_params
    params.permit :term_id
  end
end
