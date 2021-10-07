class TagsSerializer::Main < ActiveModel::Serializer
  attributes :id, :title, :slug, :updated_at, :created_at
  has_many :topics, serializer: TopicsSerializer::Main
end
