class Doctor < ActiveRecord::Base

  belongs_to :ordering_unit, counter_cache: true

  has_many :treatments

  validates :specialization, :ordering_unit, presence: true
  validates :fullname, presence: true, uniqueness: true

  delegate :name, to: :ordering_unit, prefix: true

  def self.search(query)
    if query.present?
      query = "%#{query}%"
      joins(:ordering_unit).where("fullname LIKE ? OR specialization LIKE ?
        OR ordering_units.name LIKE ?", query, query, query)
    else
      all
    end
  end

  def fullname_with_specialization
    "#{fullname} - #{specialization}"
  end
end
