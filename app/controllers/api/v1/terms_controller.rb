module API::V1
  class TermsController < APIController
    def index
      render json: Term.all, each_serializer: API::V1::TermSerializer
    end
  end
end
