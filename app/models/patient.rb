class Patient < ActiveRecord::Base
  has_one :address, as: :addressable, dependent: :destroy

  validates :sex, presence: true
  validates :fullname, presence: true, uniqueness: true
  validates :pesel, numericality: true, length: { is: 11 }

  accepts_nested_attributes_for :address

  enum sex: [ :male, :female ]
end
