def fill_address_fields(street, city, zip_code)
  fill_in t('activerecord.attributes.address.street'),   with: street
  fill_in t('activerecord.attributes.address.city'),     with: city
  fill_in t('activerecord.attributes.address.zip_code'), with: zip_code
end