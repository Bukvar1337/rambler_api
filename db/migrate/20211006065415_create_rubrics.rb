class CreateRubrics < ActiveRecord::Migration[6.0]
  def change
    create_table :rubrics do |t|
      t.string :title, null: false
      t.string :slug

      t.timestamps
    end
  end
end
