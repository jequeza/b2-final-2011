class FlightsController < ApplicationController
  def index
    @flights = Flight.flights_by_departure_city
  end

  def show
    @flight = Flight.find(params[:id])
    @adult_passangers = @flight.adult_passangers
    @adult_average_age = @flight.adult_average_age
  end
end