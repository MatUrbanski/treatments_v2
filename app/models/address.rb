class Address < ActiveRecord::Base
  validates :street, :zip_code, :city, presence: true

  belongs_to :addressable, polymorphic: true

  after_validation :geocode, if: ->(obj){ obj.present? and obj.changed? }

  geocoded_by :to_formatted_s

  def to_formatted_s
    "#{street}, #{zip_code} #{city}"
  end
end
