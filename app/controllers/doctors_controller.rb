class DoctorsController < ApplicationController
  before_action :build_doctor, only: [:new, :create]
  before_action :set_doctor, only: [:edit, :update, :destroy]

  def index
    @doctors ||= Doctor.all
  end

  def new
    @doctor.build_address if @doctor.address.nil?
  end

  def create
    if @doctor.save
      flash[:success] = t('doctors.created')
      redirect_to :doctors
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      flash[:success] = t('doctors.updated')
      redirect_to :doctors
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    flash[:error] = t('doctors.destroyed')
    redirect_to :doctors
  end

  private

  def set_doctor
    @doctor ||= Doctor.find(params[:id])
  end

  def build_doctor
    unless params[:doctor].nil?
      @doctor ||= Doctor.new(doctor_params)
    else
      @doctor ||= Doctor.new
    end
  end

  def doctor_params
    params.require(:doctor).permit(:fullname, :specialization,
      :ordering_unit_id, address_attributes: [:street, :zip_code, :city])
  end
end