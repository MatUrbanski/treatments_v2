class MonthlyReport
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month

    @data = Hash.new
    @data[:normal] = Hash.new
    @data[:normal][:all_treatments] = VisitationTime.includes(treatments: :treatment_type).
      normal_days_only(self.year, self.month).map(&:treatments).flatten

    @data[:weekend] = Hash.new
    @data[:weekend][:all_treatments] = VisitationTime.includes(:treatments).
      weekends_only(self.year, self.month).map(&:treatments).flatten

    @data[:normal][:by_treatment_type_id] =
      @data[:normal][:all_treatments].group_by(&:treatment_type_id)
    @data[:weekend][:by_treatment_type_id] =
      @data[:weekend][:all_treatments].group_by(&:treatment_type_id)

    @data[:normal][:by_treatment_types_group_id] =
      @data[:normal][:all_treatments].group_by(&:treatment_types_group_id)
    @data[:weekend][:by_treatment_types_group_id] =
      @data[:weekend][:all_treatments].group_by(&:treatment_types_group_id)
  end

  def treatments_total(options = {})
    hash = @data
    hash = hash[:normal] if options[:normal_days]
    hash = hash[:weekend] if options[:weekends]

    return hash[:by_treatment_types_group_id][options[:treatment_group_id]].
      try(:size) || 0 if options[:treatment_group_id]
    return hash[:by_treatment_type_id][options[:treatment_type_id]].
      try(:size) || 0 if options[:treatment_type_id]
  end
end
