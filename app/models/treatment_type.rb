class TreatmentType < ActiveRecord::Base
  default_scope { includes(:treatment_types_group) }

  belongs_to :treatment_types_group

  validates :name, presence: true, uniqueness: true
  validates :treatment_types_group, presence: true

  delegate :name, to: :treatment_types_group, prefix: true

  def self.search(query)
    query = "%#{query}%"
    joins(:treatment_types_group).where("treatment_types.name LIKE ?
      OR treatment_types_groups.name LIKE ?", query, query)
  end
end
