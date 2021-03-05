class Flight < ApplicationRecord
  has_many :flight_passangers
  has_many :passangers, through: :flight_passangers


  def self.flights_by_departure_city
    select("flights.*").order(:departure_city)
  end
end
