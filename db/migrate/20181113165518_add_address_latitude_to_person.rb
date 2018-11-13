class AddAddressLatitudeToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :address_latitude, :float
  end
end
