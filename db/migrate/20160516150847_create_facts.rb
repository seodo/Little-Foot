class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.text :content
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
