class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street_address
      t.string :street_address_secondary
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :latitude
      t.string :longitude
      t.boolean :active

      t.timestamps
    end
  end
end
