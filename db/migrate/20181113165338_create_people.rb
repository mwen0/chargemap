class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :family_name
      t.string :first_name
      t.boolean :gender
      t.date :birth_date
      t.string :phone_number1
      t.string :phone_number2
      t.string :website
      t.integer :address_id
      t.string :address

      t.timestamps
    end
  end
end
