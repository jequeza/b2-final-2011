class Flight < ApplicationRecord
  has_many :flight_passangers
  has_many :passangers, through: :flight_passangers


  def self.flights_by_departure_city
    select("flights.*").order(:departure_city)
  end

  def adult_passangers
    self.passangers.where("passangers.age >= 18")
  end

  def adult_average_age
     adult_passangers.average(:age)
  end
end
