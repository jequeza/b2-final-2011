class FlightPassangersController < ApplicationController
  def destroy
    flight_passanger = FlightPassanger.find_by(passanger_id: params[:id], flight_id: params[:flight_id])
    flight = Flight.find(params[:flight_id])
    flight_passanger.destroy
    redirect_to "/flights/#{flight.id}"
  end
end