class CreateTreatmentTypesGroups < ActiveRecord::Migration
  def change
    create_table :treatment_types_groups do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :treatment_types_groups, :name, unique: true
  end
end
