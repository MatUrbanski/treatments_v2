class PatientsController < ApplicationController
  before_action :build_patient, only: [:new, :create]
  before_action :set_patient, only: [:edit, :update, :destroy]

  def index
    @search_form = SearchForm.new(params[:search_form])
    @patients = @search_form.submit("patients_search").page(params[:page])
  end

  def new
    @patient.build_address if @patient.address.nil?
  end

  def create
    if @patient.save
      flash[:success] = t('patients.created')
      redirect_to :patients
    else
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      flash[:success] = t('patients.updated')
      redirect_to :patients
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    flash[:error] = t('patients.destroyed')
    redirect_to :patients
  end

  def autocomplete
    @patients = Patient.search(params[:term])
    render json: @patients.map{ |x| {label: x.fullname_with_pesel, id: x.id} }
  end

  private

  def set_patient
    @patient ||= Patient.find(params[:id])
  end

  def build_patient
    unless params[:patient].nil?
      @patient ||= Patient.new(patient_params)
    else
      @patient ||= Patient.new
    end
  end

  def patient_params
    params.require(:patient).permit(:fullname, :pesel, :sex, :birth_date,
     :without_pesel, address_attributes: [:street, :zip_code, :city])
  end
end