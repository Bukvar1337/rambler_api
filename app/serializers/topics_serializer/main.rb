class TopicsSerializer::Main < ActiveModel::Serializer
  attributes :heading, :announcement, :cover, :body, :urn, :created_at
  belongs_to :rubric, serializer: RubricsSerializer::Included
  has_many :tags, serializer: TagsSerializer::Included
end
