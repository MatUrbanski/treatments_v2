class OrderingUnit < ActiveRecord::Base
  include AddressableConcern
  default_scope { includes(:address) }

  has_many :doctors

  validates :name, presence: true, uniqueness: true

  def doctors_count
    doctors.count
  end

  def self.search(query)
    query = "%#{query}%"
    joins(:address).where("name LIKE ? OR addresses.street LIKE ?
      OR addresses.city LIKE ?OR addresses.zip_code LIKE ?",
      query, query, query, query)
  end
end
