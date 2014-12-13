class OrderingUnit < ActiveRecord::Base
  has_many :doctors
  has_one :address, as: :addressable, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :address
end
