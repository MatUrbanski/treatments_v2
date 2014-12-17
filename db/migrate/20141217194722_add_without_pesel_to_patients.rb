class AddWithoutPeselToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :without_pesel, :boolean, default: false
  end
end
