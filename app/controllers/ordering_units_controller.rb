class OrderingUnitsController < ApplicationController

  def index
    @ordering_units ||= OrderingUnit.all
  end
end