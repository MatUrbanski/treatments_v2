class TreatmentType < ActiveRecord::Base
  belongs_to :treatment_types_group

  has_many :treatments

  validates :name, presence: true, uniqueness: true
  validates :treatment_types_group, presence: true

  delegate :name, to: :treatment_types_group, prefix: true

  def self.search(query)
    if query.present?
      query = "%#{query}%"
      joins(:treatment_types_group).where("treatment_types.name LIKE ?
        OR treatment_types_groups.name LIKE ?", query, query)
    else
      all
    end
  end

  def name_with_group_name
    "#{name} - #{treatment_types_group_name}"
  end
end
