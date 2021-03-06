module TreatmentsHelper
  def patient_find_value
    if @treatment.persisted? && @treatment.patient.present?
      @treatment.patient.fullname_with_pesel
    elsif params[:treatment].present?
      params[:treatment][:patient_find]
    elsif params[:copy_from].present?
      patient = Treatment.find(params[:copy_from]).patient_id
      @treatment.patient.fullname_with_pesel
    else
      nil
    end
  end
end