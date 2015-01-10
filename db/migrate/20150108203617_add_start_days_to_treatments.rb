class AddStartDaysToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :start_days, :integer
  end
end
