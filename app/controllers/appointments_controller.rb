class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  def index
    @patient = current_user.patients.find_by_id(params[:patient_id])
    @doctor = Doctor.find_by_id(params[:doctor_id])
    if @patient
      @appointments = @patient.appointments
    elsif @doctor
      @appointments = @doctor.appointments
    else
      @appointments = current_user.appointments
    end

  end

  def new
    @patient = current_user.patients.find_by_id(params[:patient_id])
    @doctor = Doctor.find_by_id(params[:doctor_id])
    if @patient
      @appointment = @patient.appointments.build
    elsif @doctor
      @appointment = @doctor.appointments.build
    else
      @appointment = Appointment.new
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: "Appointment created successfully"}
        format.json { render :show, status: :created, location: @appointment}
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json { render json: @appointment.errors, status: :unprocessable_entity}
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment updated successfully"}
        format.json { render :show, status: :ok, location: @appointment}
      else
        format.html {render :edit, status: :unprocessable_entity}
        format.json { render json: @appointment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment deleted successfully"}
      format.json { head :no_content }
    end
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find_by_id(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:location, :start_time, :end_time, :patient_id, :doctor_id)
  end
end
