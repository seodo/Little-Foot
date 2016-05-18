class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :image
      t.text :bio
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
