class TreatmentTypesController < ApplicationController
  before_action :build_treatment_type, only: [:new, :create]
  before_action :set_treatment_type, only: [:edit, :update, :destroy]

  def index
    @search_form = SearchForm.new(params[:search_form])
    @treatment_types = @search_form.submit('treatment_types_search').page(params[:page])
  end

  def create
    if @treatment_type.save
      flash[:success] = t('.created')
      redirect_to :treatment_types
    else
      render :new
    end
  end

  def update
    if @treatment_type.update(treatment_type_params)
      flash[:success] = t('.updated')
      redirect_to :treatment_types
    else
      render :edit
    end
  end

  def destroy
    @treatment_type.destroy
    flash[:error] = t('.destroyed')
    redirect_to :treatment_types
  end

  private

  def set_treatment_type
    @treatment_type = TreatmentType.find(params[:id])
  end

  def build_treatment_type
    unless params[:treatment_type].nil?
      @treatment_type = TreatmentType.new(treatment_type_params)
    else
      @treatment_type = TreatmentType.new
    end
  end

  def treatment_type_params
    params.require(:treatment_type).permit(:name, :treatment_types_group_id)
  end
end