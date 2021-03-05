class PatientsController < ApplicationController
  def index
    @patients_by_age = Patient.patients_by_age
  end
end