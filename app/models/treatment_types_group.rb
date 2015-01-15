class TreatmentTypesGroup < ActiveRecord::Base
  default_scope { includes(:treatment_types) }

  has_many :treatment_types, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
