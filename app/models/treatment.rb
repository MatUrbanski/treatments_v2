class Treatment < ActiveRecord::Base
  attr_accessor :patient_find
  default_scope { includes(:patient, :doctor, :treatment_type, :visitation_times) }

  belongs_to :patient, counter_cache: true
  belongs_to :doctor, counter_cache: true
  belongs_to :treatment_type, counter_cache: true

  has_many :treatment_times, dependent: :destroy
  has_many :visitation_times, through: :treatment_times

  validates :patient, :doctor, :treatment_type, presence: true
  validate :patient_find

  delegate :fullname_with_pesel, to: :patient, prefix: true
  delegate :fullname_with_specialization, to: :doctor, prefix: true
  delegate :name, to: :treatment_type, prefix: true

  def self.search(query)
    query = "%#{query}%"
    joins(:patient, :doctor, :treatment_type).where("patients.fullname LIKE ? OR
      patients.pesel LIKE ? OR doctors.fullname LIKE ? OR doctors.specialization LIKE ? OR
      treatment_types.name LIKE ? OR medicine LIKE ?", query, query, query, query, query, query)
  end

  def patient_find
    if patient_id.nil?
      errors[:patient_find] <<
        I18n.t('.activerecord.errors.models.treatment.attributes.patient_find.blank')
    end
  end

  def visitation_times_count
    visitation_times.count
  end
end
