require 'rails_helper'

RSpec.describe Flight, type: :model do
  it {should have_many :flight_passangers}
  it {should have_many(:passangers).through(:flight_passangers)}

  describe "class methods" do
    describe "::flights_by_departure_city" do
      it "returns flights ordered alphabetically by departure city" do
        vacation1 = Flight.create!(number: "1234", date: "06/12/2021", departure_city: "Chicago", arrival_city: "Cancun")
        work1 = Flight.create!(number: "3456", date: "08/03/2020", departure_city: "Atlanta", arrival_city: "Los Angeles")
        vacation2= Flight.create!(number: "12234", date: "06/12/2021", departure_city: "Los Angeles", arrival_city: "London")
        work2 = Flight.create!(number: "3411", date: "08/03/2020", departure_city: "Miami", arrival_city: "Seattle")
          expect(Flight.flights_by_departure_city).to eq([work1, vacation1, vacation2, work2])
          expect(Flight.flights_by_departure_city.first).to eq(work1)
          expect(Flight.flights_by_departure_city.last).to eq(work2)
      end
    end
  end
end
