class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
