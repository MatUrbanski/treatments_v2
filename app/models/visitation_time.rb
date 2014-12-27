class VisitationTime < ActiveRecord::Base
  validates :day, :time_of_day, presence: true

  has_many :treatment_times
  has_many :treatments, through: :treatment_times
end
