class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.integer :category_id, null: false
      t.integer :follow_up_id

      t.timestamps null: false
    end
  end
end

