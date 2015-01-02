module PatientsHelper
  def patient_pesel(patient)
    if patient.without_pesel == false
      patient.pesel
    else
      content_tag :div, class: "pesel_alert" do
        t('patients.pesel_alert')
      end
    end
  end

  def patient_fullname_with_pesel(patient)
    if patient.without_pesel == false
      patient.fullname_with_pesel
    else
      content_tag :div, class: "pesel_alert" do
        "#{patient.fullname} - #{t('patients.pesel_alert')}"
      end
    end
  end
end