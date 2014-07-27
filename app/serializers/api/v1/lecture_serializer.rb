class API::V1::LectureSerializer < ActiveModel::Serializer
  attributes :id, :details_url, :session, :room, :building, :reference_number, :seats_left
  has_one :course, serializer: API::V1::CourseSerializer
end
