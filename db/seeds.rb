["Lecznicze", "Diagnostyka", "Profilaktyka"].each do |type|
  TreatmentTypesGroup.where(name: type).first_or_create!
end