class Patient < ActiveRecord::Base
  include AddressableConcern
  extend Enumerize
  paginates_per 10
  default_scope { includes(:address) }

  has_many :treatments

  validates :sex, presence: true
  validates :fullname, presence: true, uniqueness: true
  validates :pesel, numericality: true, length: { is: 11 },
    unless: :without_pesel?
  validates :birth_date, date: true, allow_nil: true

  enumerize :sex, in: [:male, :female]

  def self.search(query)
    query = "%#{query}%"
    joins(:address).where("fullname LIKE ? OR pesel LIKE ?
      OR addresses.street LIKE ? OR addresses.city LIKE ?
      OR addresses.zip_code LIKE ?", query, query, query, query, query)
  end

  def without_pesel?
    without_pesel == true
  end

  def fullname_with_pesel
    patient_pesel = without_pesel? ? I18n.t('patients.pesel_alert') : pesel
    "#{fullname} - #{patient_pesel}"
  end
end
