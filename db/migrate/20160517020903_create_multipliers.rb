class CreateMultipliers < ActiveRecord::Migration
  def change
    create_table :multipliers do |t|
      t.float :value
      t.string :name
      t.string :suggestion

      t.timestamps null: false
    end
  end
end
