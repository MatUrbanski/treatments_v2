class Treatment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :treatment_type

  has_many :treatment_times
  has_many :visitation_times, through: :treatment_times
end
