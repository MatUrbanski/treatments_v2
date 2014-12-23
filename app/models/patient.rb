class Patient < ActiveRecord::Base
  extend Enumerize
  paginates_per 10
  has_one :address, as: :addressable, dependent: :destroy

  validates :sex, presence: true
  validates :fullname, presence: true, uniqueness: true
  validates :pesel, numericality: true, length: { is: 11 },
    unless: :without_pesel?
  validates :birth_date, date: true, allow_nil: true

  accepts_nested_attributes_for :address

  enumerize :sex, in: [:male, :female]

  def without_pesel?
    without_pesel == true
  end

  def self.search(query)
    query = "%#{query}%"
    where("fullname LIKE ? OR pesel LIKE ?", query, query)
  end
end
