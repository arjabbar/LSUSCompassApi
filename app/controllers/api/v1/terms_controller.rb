class API::V1::TermsController < ApplicationController
  def index
    render json: Term.all, each_serializer: API::V1::TermSerializer
  end
end
