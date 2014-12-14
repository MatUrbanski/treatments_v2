class Doctor < ActiveRecord::Base
  has_one :address, as: :addressable, dependent: :destroy
  belongs_to :ordering_unit

  validates :specialization, :ordering_unit, presence: true
  validates :fullname, presence: true, uniqueness: true

  accepts_nested_attributes_for :address
end
