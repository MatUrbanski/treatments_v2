class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :patient, index: true, null: false
      t.references :doctor, index: true, null: false
      t.references :treatment_type, index: true, null: false
      t.string :medicine

      t.timestamps
    end
    add_foreign_key :treatments, :patients
    add_foreign_key :treatments, :doctors
    add_foreign_key :treatments, :treatment_types
  end
end
