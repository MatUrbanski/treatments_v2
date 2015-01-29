class TreatmentTypesGroup < ActiveRecord::Base
  has_many :treatment_types, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
