class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :town
      t.integer :post_code
      t.string :state_or_province
      t.boolean :has_ev_parking_places
      t.integer :country_id

      t.timestamps
    end
  end
end
