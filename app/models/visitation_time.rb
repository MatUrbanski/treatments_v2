class VisitationTime < ActiveRecord::Base
  validates :day, :time_of_day, presence: true
end
