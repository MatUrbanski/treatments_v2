class SearchForm
  include Virtus.model
  include ActiveModel::Model

  attribute :query, String

  def submit(action)
    eval(action)
  end

  private

  def ordering_units_search
    OrderingUnit.includes(:address).search(query)
  end

  def doctors_search
    Doctor.includes(:ordering_unit).search(query)
  end

  def treatment_types_search
    TreatmentType.includes(:treatment_types_group).search(query)
  end

  def patients_search
    Patient.includes(:address).search(query)
  end

  def treatments_search
    Treatment.includes(:patient, :doctor, :treatment_type, :visitation_times).search(query)
  end
end
