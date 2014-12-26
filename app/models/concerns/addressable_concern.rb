module AddressableConcern
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable, dependent: :destroy
    delegate :street, :city, :zip_code, :to_formatted_s, to: :address, prefix: true
    accepts_nested_attributes_for :address
  end
end