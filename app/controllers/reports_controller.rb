class ReportsController < ApplicationController

  def monthly
    if params.has_key?(:monthly_report)
      @date = Date.new(params[:date][:year].to_i, params[:date][:month].to_i)
    else
      @date = Date.today
    end

    @report = MonthlyReportPresenterService.new(@date.year, @date.month)
  end
end
