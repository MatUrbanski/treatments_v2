class CreateOrderingUnits < ActiveRecord::Migration
  def change
    create_table :ordering_units do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
