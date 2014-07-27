class API::V1::CourseSerializer < ActiveModel::Serializer
  attributes :id, :description, :book_url, :code
end
