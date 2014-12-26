class Treatment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :treatment_type
end
