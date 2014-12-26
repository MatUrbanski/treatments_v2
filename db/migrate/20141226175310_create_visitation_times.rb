class CreateVisitationTimes < ActiveRecord::Migration
  def change
    create_table :visitation_times do |t|
      t.date :day, null: false
      t.string :time_of_day, null: false
    end
  end
end
