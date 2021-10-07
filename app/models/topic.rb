class Topic < ApplicationRecord
  validates :heading, presence: true
  validates :urn, presence: true, uniqueness: true
  belongs_to :rubric
  has_many :tag_topics, dependent: :destroy
  has_many :tags, through: :tag_topics

  accepts_nested_attributes_for :tag_topics, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true
end
