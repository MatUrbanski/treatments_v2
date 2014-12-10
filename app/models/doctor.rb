class Doctor < ActiveRecord::Base
  belongs_to :ordering_unit
  validates :first_name, :last_name, :specialization, :ordering_unit
end
