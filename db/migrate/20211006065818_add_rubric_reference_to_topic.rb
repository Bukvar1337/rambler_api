class AddRubricReferenceToTopic < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :rubric, foreign_key: true
  end
end
