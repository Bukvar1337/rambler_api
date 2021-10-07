class AddBodyToTopic < ActiveRecord::Migration[6.0]
  def change
    add_column    :topics, :body, :text
  end
end
