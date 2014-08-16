class API::V1::ErrorSerializer < ActiveModel::Serializer
  attribute :message
  def message
    object.message
  end
end