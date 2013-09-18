class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :image
      t.string :phone_number
      t.string :website_url
      t.integer :owner_id

      t.timestamps
    end
  end
end
