class AddAddressFormattedAddressToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :address_formatted_address, :string
  end
end
