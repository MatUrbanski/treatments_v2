require 'rails_helper'

describe VisitationTime do
  let!(:old_visitation_time) { create(:visitation_time, day: 1.month.ago) }
  let!(:visitation_time) { create(:visitation_time, day: Date.today) }

  describe ".nearest_days" do
    it "should return proper collection of visitation times" do
      expect(VisitationTime.nearest_days(2.days, 10.days)).to match_array visitation_time
      expect(VisitationTime.nearest_days(40.days, 10.days)).to match_array [old_visitation_time, visitation_time]
    end
  end
end
