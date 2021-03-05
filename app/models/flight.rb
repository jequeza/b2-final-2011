class Flight < ApplicationRecord
  has_many :flight_passangers
  has_many :passangers, through: :flight_passangers
end
