class CreateImpactItems < ActiveRecord::Migration
  def change
    create_table :impact_items do |t|
      t.string :name, null: false
      t.float :carbon, null: false

      t.timestamps null: false
    end
  end
end
