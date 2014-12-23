class CreateTreatmentTypes < ActiveRecord::Migration
  def change
    create_table :treatment_types do |t|
      t.string :name
      t.references :treatment_types_group, index: true

      t.timestamps
    end
    add_foreign_key(:treatment_types, :treatment_types_groups)
    add_index :treatment_types, :name, unique: true
  end
end
