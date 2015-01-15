class VisitationTime < ActiveRecord::Base
  scope :nearest_days, ->(start_days) {
    where("day >= ? and day <= ?", Date.today - start_days, Date.today) }

  scope :weekends_only, ->(year, month){
    where(%q{ EXTRACT(DOW FROM day) IN (0, 6) AND
      EXTRACT(YEAR FROM day) = ?  AND EXTRACT(MONTH FROM day) = ? }, year, month) }

  scope :normal_days_only, ->(year, month){
    where(%q{ EXTRACT(DOW FROM day) BETWEEN 1 AND 5 AND EXTRACT(YEAR FROM day) =
      ?  AND EXTRACT(MONTH FROM day) = ? },year, month) }

  has_many :treatment_times
  has_many :treatments, through: :treatment_times

  validates :day, :time_of_day, presence: true

  def day_with_time_of_day
    day_name =  I18n.t(:"date.day_names")[day.wday]
    "#{day} - #{day_name} #{human_time_of_day}"
  end

  def human_time_of_day
    if time_of_day == "morning"
      "(#{I18n.t('.morning')})"
    else
      "(#{I18n.t('.evening')})"
    end
  end
end
