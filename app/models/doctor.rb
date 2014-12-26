class Doctor < ActiveRecord::Base
  include AddressableConcern
  default_scope { includes(:address, :ordering_unit) }

  belongs_to :ordering_unit

  validates :specialization, :ordering_unit, presence: true
  validates :fullname, presence: true, uniqueness: true

  delegate :name, to: :ordering_unit, prefix: true

  def self.search(query)
    query = "%#{query}%"
    joins(:address, :ordering_unit).where("fullname LIKE ? OR specialization LIKE ?
      OR addresses.street LIKE ? OR addresses.city LIKE ? OR addresses.zip_code LIKE ?
      OR ordering_units.name LIKE ?", query, query, query, query, query, query)
  end
end
