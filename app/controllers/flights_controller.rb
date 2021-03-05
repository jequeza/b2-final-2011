class FlightsController < ApplicationController
  def index
    @flights = Flight.flights_by_departure_city
  end
end