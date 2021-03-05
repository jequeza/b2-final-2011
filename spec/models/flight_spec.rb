require 'rails_helper'

RSpec.describe Flight, type: :model do
  before :each do
    @vacation = Flight.create!(number: "1234", date: "06/12/2021", departure_city: "Chicago", arrival_city: "Cancun")
    @jack = @vacation.passangers.create!(name: "Jack Wilson", age: 23)
    @sam = @vacation.passangers.create!(name: "Sam Wilson", age: 28)
    @jordan = @vacation.passangers.create!(name: "Jordan Wilson", age: 21)
    @steve = @vacation.passangers.create!(name: "Steve Wilson", age: 16)
  end
  describe "relationships" do
    it {should have_many :flight_passangers}
    it {should have_many(:passangers).through(:flight_passangers)}
  end
  describe "class methods" do
    describe "::flights_by_departure_city" do
      it "returns flights ordered alphabetically by departure city" do
        vacation1 = Flight.create!(number: "1234", date: "06/12/2021", departure_city: "Chicago", arrival_city: "Cancun")
        work1 = Flight.create!(number: "3456", date: "08/03/2020", departure_city: "Atlanta", arrival_city: "Los Angeles")
        vacation2= Flight.create!(number: "12234", date: "06/12/2021", departure_city: "Los Angeles", arrival_city: "London")
        work2 = Flight.create!(number: "3411", date: "08/03/2020", departure_city: "Miami", arrival_city: "Seattle")
        expect(Flight.flights_by_departure_city.first).to eq(work1)
        expect(Flight.flights_by_departure_city.last).to eq(work2)
      end
    end
  end
  describe "instance methods" do
    describe "#adult_passangers" do
      it "returns all the passangers for given flight who are 18 years or older" do
        expect(@vacation.adult_passangers).to eq([@jack, @sam, @jordan])
        expect(@vacation.adult_passangers.any?).to_not eq([@steve])
      end
    end
    describe "#adult_average_age" do
      it "returns average age for all the adult passangers" do
        expect(@vacation.adult_average_age).to eq(24)
      end
    end
  end
end