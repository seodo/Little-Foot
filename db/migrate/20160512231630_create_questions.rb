class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.string :identifier
      t.integer :category_id, null: false
      t.boolean :lifestyle_choices

      t.timestamps null: false
    end
  end
end

