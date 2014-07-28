class API::V1::ProfessorsController < ApplicationController
  def index
    render json: Professor.all, each_serializer: API::V1::ProfessorSerializer
  end

end
