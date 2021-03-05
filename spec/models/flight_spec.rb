require 'rails_helper'

RSpec.describe Flight, type: :model do
  it {should have_many :flight_passangers}
  it {should have_many(:passangers).through(:flight_passangers)}
end
