module API::V1
  class APIController < ApplicationController

    rescue_from ActionController::ParameterMissing, with: :missing_param

    def missing_param exception
      render json: exception, serializer: API::V1::ErrorSerializer
    end

  end
end
