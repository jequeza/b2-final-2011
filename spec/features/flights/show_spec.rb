require 'rails_helper'
# User Story 2, Flight Show Page

# As a visitor
# When I visit a flight's show page
# Then I see the flight's number, date, time, departure city, and arrival city
# And I see the names of all adult passengers on the flight
# And I see the average age of all adult passengers on the flight
#
# Note: an "adult passenger" is a passenger whose age is greater than or equal to 18

RSpec.describe "Show Page" do
  before :each do
    @vacation = Flight.create!(number: "1234", date: "06/12/2021", departure_city: "Chicago", arrival_city: "Cancun")
    @jack = @vacation.passangers.create!(name: "Jack Wilson", age: 23)
    @sam = @vacation.passangers.create!(name: "Sam Wilson", age: 28)
    @jordan = @vacation.passangers.create!(name: "Jordan Wilson", age: 21)
    @steve = @vacation.passangers.create!(name: "Steve Wilson", age: 16)
    @work = Flight.create!(number: "3456", date: "08/03/2020", departure_city: "Miami", arrival_city: "Los Angeles")
  end
  describe "As a visitor" do
    describe "When I visit a flight's show page" do
      it "I see the flight's number, date, time, departure city, and arrival city" do
        visit "/flights/#{@vacation.id}"
          within "#flight-info" do
            expect(page).to have_content(@vacation.number)
            expect(page).to have_content(@vacation.departure_city)
            expect(page).to have_content(@vacation.arrival_city)
            expect(page).to_not have_content(@work.number)
            expect(page).to_not have_content(@work.departure_city)
            expect(page).to_not have_content(@work.arrival_city)
          end
      end
      it "I see the names of all adult passengers on the flight" do
        visit "/flights/#{@vacation.id}"
          within "#adult-passangers" do
            expect(page).to have_content(@jack.name)
            expect(page).to have_content(@sam.name)
            expect(page).to have_content(@jordan.name)
            expect(page).to_not have_content(@steve.name)
          end
      end
      it "I see the average age of all adult passengers on the flight" do
        visit "/flights/#{@vacation.id}"
          within "#adult-average-age" do
            expect(page).to have_content(@vacation.adult_average_age)
          end
      end
    end
  end
end