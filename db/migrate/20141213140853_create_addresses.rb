class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :zip_code, null: false
      t.float :latitude
      t.float :longitude
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
