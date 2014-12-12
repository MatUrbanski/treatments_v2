class CreateOrderingUnits < ActiveRecord::Migration
  def change
    create_table :ordering_units do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
    add_index :ordering_units, :name, unique: true
  end
end
