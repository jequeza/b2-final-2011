require 'rails_helper'

RSpec.describe Passanger, type: :model do
  it {should have_many :flight_passangers}
  it {should have_many(:flights).through(:flight_passangers)}
end
