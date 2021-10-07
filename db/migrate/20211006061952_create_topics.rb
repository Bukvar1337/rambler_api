class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :heading, null: false
      t.string :announcement
      t.text :cover
      t.text :urn, null: false

      t.timestamps
    end
  end
end
