class API::V1::TermSerializer < ActiveModel::Serializer
  attributes :id, :dom_value, :start_date, :end_date
end
