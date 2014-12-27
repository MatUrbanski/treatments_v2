class AddCounterCacheColumns < ActiveRecord::Migration
  def change
    add_column :ordering_units, :doctors_count, :integer, default: 0
    add_column :treatments, :patients_count, :integer, default: 0
    add_column :treatments, :doctors_count, :integer, default: 0
    add_column :treatments, :treatment_types_count, :integer, default: 0
    add_column :patients, :treatments_count, :integer, default: 0
    add_column :treatment_types, :treatments_count, :integer, default: 0
    add_column :doctors, :treatments_count, :integer, default: 0
  end
end
