class CreateTreatmentTimes < ActiveRecord::Migration
  def change
    create_table :treatment_times do |t|
      t.references :visitation_time, index: true
      t.references :treatment, index: true

      t.timestamps
    end
    add_foreign_key :treatment_times, :visitation_times
    add_foreign_key :treatment_times, :treatments
  end
end
