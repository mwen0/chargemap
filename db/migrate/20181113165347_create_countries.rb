class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :isocode
      t.string :continent_code
      t.string :flag_image

      t.timestamps
    end
  end
end
