class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  def index
    @patients = current_user.patients
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = current_user.patients.build(patient_params)
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: "Patient created successfully"}
        format.json { render :show, status: :created, location: @patient}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @patient.errors, status: :unprocessable_entity}
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "Patient updated successfully"}
        format.json { render :show, status: :ok, location: @patient}
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json { render json: @patient.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient deleted successfully"}
      format.json { head :no_content}
    end
  end

  private

  def set_patient
    @patient = current_user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name)
  end
end
