class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :topics, :urn, unique: true
    add_index :tags, :title, unique: true
    add_index :rubrics, :title, unique: true
  end
end
