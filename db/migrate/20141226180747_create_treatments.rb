class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :patient, index: true
      t.references :doctor, index: true
      t.references :treatment_type, index: true
      t.string :medicine

      t.timestamps null: false
    end
    add_foreign_key :treatments, :patients
    add_foreign_key :treatments, :doctors
    add_foreign_key :treatments, :treatment_types
  end
end
