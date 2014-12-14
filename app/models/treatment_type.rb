class TreatmentType < ActiveRecord::Base
  belongs_to :treatment_types_group

  validates :name, presence: true, uniqueness: true
  validates :treatment_types_group, presence: true
end
