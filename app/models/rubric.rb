class Rubric < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  before_save :translite
  has_many :topics

  def translite
    self.slug = Translit.convert("#{self.title}") if changes[:title]
  end

end
