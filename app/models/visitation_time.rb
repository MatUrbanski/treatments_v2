class VisitationTime < ActiveRecord::Base
  has_many :treatment_times
  has_many :treatments, through: :treatment_times

  validates :day, :time_of_day, presence: true
end
