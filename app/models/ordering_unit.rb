class OrderingUnit < ActiveRecord::Base
  has_one :address, as: :addressable, dependent: :destroy
  has_many :doctors

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :address

  def doctors_count
    doctors.count || 0
  end
end
