require 'rails_helper'

RSpec.describe "Index Page" do
  before :each do
    @vacation = Flight.create!(number: "1234", date: "06/12/2021", departure_city: "Chicago", arrival_city: "Cancun")
    @work = Flight.create!(number: "3456", date: "08/03/2020", departure_city: "Miami", arrival_city: "Los Angeles")
    @vacation2= Flight.create!(number: "12234", date: "06/12/2021", departure_city: "Los Angeles", arrival_city: "London")
    @work2 = Flight.create!(number: "3411", date: "08/03/2020", departure_city: "San Diego", arrival_city: "Seattle")
  end
  describe "As a visitor" do
    describe "When I visit the flights index page" do
      it "I see each flight in the system including its number, departure city, and arrival city" do
        visit "/flights"
          within "#all-flights" do
            expect(page).to have_content(@vacation.number)
            expect(page).to have_content(@vacation.departure_city)
            expect(page).to have_content(@vacation.arrival_city)
            expect(page).to have_content(@work.number)
            expect(page).to have_content(@work.departure_city)
            expect(page).to have_content(@work.arrival_city)
          end
      end
      it "I see that flights are listed in alphabetical order by departure city (A - Z)" do
        visit "/flights"
          within "#all-flights" do
            expect(@vacation.number).to appear_before(@work.number)
            expect(@vacation2.number).to appear_before(@work2.number)
            expect(@vacation2.number).to_not appear_before(@vacation.number)
            expect(@work2.number).to_not appear_before(@work.number)
          end
      end
    end
  end
end