class Treatment < ActiveRecord::Base
  belongs_to :patient, counter_cache: true
  belongs_to :doctor, counter_cache: true
  belongs_to :treatment_type, counter_cache: true

  has_many :treatment_times
  has_many :visitation_times, through: :treatment_times
end
