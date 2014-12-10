class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :specialization, null: false
      t.references :ordering_unit, index: true, null: false

      t.timestamps
    end

    add_foreign_key(:doctors, :ordering_units, exclude_index: true)
  end
end
