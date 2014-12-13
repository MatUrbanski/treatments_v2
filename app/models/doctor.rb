class Doctor < ActiveRecord::Base
  belongs_to :ordering_unit
  validates :specialization, :ordering_unit, presence: true
  validates :full_name, presence: true, uniqueness: true
end
