class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :fullname, null: false
      t.string :specialization, null: false
      t.references :ordering_unit, index: true, null: false, unique: true

      t.timestamps
    end

    add_index :doctors, :fullname, unique: true
    add_foreign_key(:doctors, :ordering_units, exclude_index: true)
  end
end
