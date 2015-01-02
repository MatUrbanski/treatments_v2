module TreatmentsHelper
  def patient_find_value()
    if @treatment.persisted? && @treatment.patient.present?
      @treatment.patient.fullname_with_pesel
    elsif params[:treatment].present?
      params[:treatment][:patient_find]
    else
      nil
    end
  end
end