class TreatmentsController < ApplicationController
  before_action :build_treatment, only: [:new, :create]
  before_action :set_treatment, only: [:edit, :update, :destroy]

  def index
    @search_form = SearchForm.new(params[:search_form])
    @treatments = @search_form.submit('treatments_search').page(params[:page])
  end

   def create
    if @treatment.save
      flash[:success] = t('treatments.created')
      redirect_to :treatments
    else
      render :new
    end
  end

  def update
    if @treatment.update(treatment_params)
      flash[:success] = t('treatments.updated')
      redirect_to :treatments
    else
      render :edit
    end
  end

  def destroy
    @treatment.destroy
    flash[:error] = t('treatments.destroyed')
    redirect_to :treatments
  end

  private

  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  def build_treatment
    unless params[:treatment].nil?
      @treatment = Treatment.new(treatment_params)
    else
      @treatment = Treatment.new
    end
  end

  def treatment_params
    params.require(:treatment).permit(:patient_find, :patient_id, :doctor_id,
      :treatment_type_id, :medicine, visitation_time_ids: [])
  end
end