class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :impact_item_id, null: false
      t.decimal :quantity
      t.integer :question_id, null: false
      t.integer :survey_id, null: false

      t.timestamps null: false
    end
  end
end





