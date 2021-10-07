class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  before_save :translite
  has_many :tag_topics, dependent: :destroy
  has_many :topics, through: :tag_topics

  def translite
    self.slug = Translit.convert("#{self.title}") if changes[:title]
  end
end
