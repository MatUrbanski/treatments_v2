class Address < ActiveRecord::Base
  validates :street, :zip_code, :city, presence: true

  belongs_to :addressable, polymorphic: true

  geocoded_by :to_formatted_s
  after_validation :geocode, if: ->(obj){ obj.street.present? and obj.street_changed? }

  def to_formatted_s
    "#{street}, #{zip_code} #{city}"
  end
end
