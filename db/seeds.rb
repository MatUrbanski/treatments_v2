["Lecznicze", "Diagnostyka", "Profilaktyka"].each do |type|
  TreatmentTypesGroup.where(name: type).first_or_create!
end

treatment_types = {
  "Domięśniowe" => "Lecznicze",
  "Dożylne" => "Lecznicze",
  "Wenflon" => "Lecznicze",
  "Opatrunek" => "Lecznicze",
  "Podskórne" => "Lecznicze",
  "Pobranie krwi" => "Diagnostyka",
  "Pomiar cukru" => "Diagnostyka",
  "Pomiar ciśnienia" => "Diagnostyka",
  "Pouczenie" => "Profilaktyka",
  "Toaleta przeciwodleżynowa" => "Lecznicze",
  "Kroplówka" => "Lecznicze",
  "Wymiana cewnika" => "Lecznicze"
}

treatment_types.each do |key, value|
  group = TreatmentTypesGroup.find_by_name(value)
  TreatmentType.where(name: key, treatment_types_group: group).first_or_create!
end
