class OrderingUnit < ActiveRecord::Base
  has_many :doctors
  validates :name, presence: true
end