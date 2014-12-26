class TreatmentTime < ActiveRecord::Base
  belongs_to :visitation_time
  belongs_to :treatment
end
