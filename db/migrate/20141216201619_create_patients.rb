class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :fullname, null: false
      t.string :pesel
      t.string :sex, null: false
      t.date :birth_date

      t.timestamps
    end
    add_index :patients, :fullname, unique: true
    add_index :patients, :pesel, unique: true
  end
end
