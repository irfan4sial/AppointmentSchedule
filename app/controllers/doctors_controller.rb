class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: [:show]
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: "Doctor created successfully"}
        format.json { render :show, status: :created, location: @doctor}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @doctor.errors, status: :unprocessable_entity}
      end
    end
  end

  def show

  end


  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :phone_number, :specialization)
  end
end
