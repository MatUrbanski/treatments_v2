class Address < ActiveRecord::Base
  validates :street, :city, presence: true
  validates :zip_code, presence: true, format: {with: /[0-9]{2}-[0-9]{3}/}

  belongs_to :addressable, polymorphic: true

  after_validation :geocode, if: ->(obj){ obj.present? and obj.changed? }

  geocoded_by :to_formatted_s

  def to_formatted_s
    "#{street}, #{zip_code} #{city}"
  end
end
