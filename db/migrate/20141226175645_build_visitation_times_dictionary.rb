class BuildVisitationTimesDictionary < ActiveRecord::Migration
  def change
     final_day = Date.parse('2024-12-31')

    d = Date.parse('2014-12-01')

    while d < final_day
      VisitationTime.create(day: d, time_of_day: 'morning')
      VisitationTime.create(day: d, time_of_day: 'evening')
      d += 1.day
    end
  end
end
