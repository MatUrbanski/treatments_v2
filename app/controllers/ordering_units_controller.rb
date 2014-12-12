class OrderingUnitsController < ApplicationController
  before_action :build_ordering_unit, only: [:new, :create]
  before_action :set_ordering_unit, only: [:edit, :update, :destroy]

  def index
    @ordering_units ||= OrderingUnit.all
  end

  def create
    if @ordering_unit.save
      redirect_to :ordering_units, sucess: t('ordering_units.created')
    else
      render :new
    end
  end

  def update
    if @ordering_unit.update(ordering_unit_params)
      redirect_to :ordering_units, sucess: t('ordering_units.updated')
    else
      render :edit
    end
  end

  def destroy
    @ordering_unit.destroy
    redirect_to :ordering_units, sucess: t('ordering_units.destroyed')
  end

  private

  def set_ordering_unit
    @ordering_unit ||= OrderingUnit.find(params[:id])
  end

  def build_ordering_unit
    unless params[:ordering_unit].nil?
      @ordering_unit ||= OrderingUnit.new(ordering_unit_params)
    else
      @ordering_unit ||= OrderingUnit.new
    end
  end

  def ordering_unit_params
    params.require(:ordering_unit).permit(:name)
  end
end