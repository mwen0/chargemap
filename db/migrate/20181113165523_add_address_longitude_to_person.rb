class AddAddressLongitudeToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :address_longitude, :float
  end
end
