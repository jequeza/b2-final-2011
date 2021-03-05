class FlightPassangersController < ApplicationController
  def destroy
    flight_passanger = FlightPassanger.find(params[:id])
    flight = flight_passanger.flight
    flight_passanger.destroy
    redirect_to "/flights/#{flight.id}"
  end
end