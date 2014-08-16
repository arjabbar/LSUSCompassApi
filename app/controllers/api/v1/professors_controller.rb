module API::V1
  class ProfessorsController < APIController
    def index
      render json: Professor.all, each_serializer: API::V1::ProfessorSerializer
    end
  end
end
