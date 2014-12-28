class SearchForm
  include Virtus.model
  include ActiveModel::Model

  attribute :query, String

  def submit(action)
    eval(action)
  end

  private

  def ordering_units_search
    OrderingUnit.search(query)
  end

  def doctors_search
    Doctor.search(query)
  end

  def treatment_types_search
    TreatmentType.search(query)
  end

  def patients_search
    Patient.search(query)
  end

  def treatments_search
    Treatment.search(query)
  end
end
