class TreatmentType < ActiveRecord::Base
  belongs_to :treatment_types_group

  validates :name, presence: true, uniqueness: true
  validates :treatment_types_group, presence: true

  def self.search(query)
    query = "%#{query}%"
    joins(:treatment_types_group).where("treatment_types.name LIKE ?
      OR treatment_types_groups.name LIKE ?", query, query)
  end
end
