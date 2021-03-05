require 'rails_helper'

RSpec.describe "Index Page" do
  before :each do
    @katie = Patient.create!(name: "Katie Bryce", age: 24)
    @denny = Patient.create!(name: "Denny Duquette", age: 39)
    @rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
    @zola = Patient.create!(name: "Zola Shepherd", age: 2)
  end
  describe "As a visitor" do
    describe "When I visit the patients index page" do
      it "I see the names of all patients listed from oldest to youngest" do
        visit "/patients"
          within "#all-patients" do
            expect(page).to have_content(@katie.name)
            expect(page).to have_content(@denny.name)
            expect(page).to have_content(@rebecca.name)
            expect(page).to have_content(@zola.name)
          end
          within "#all-patients" do
            expect(@denny.name).to appear_before(@zola.name)
            expect(@rebecca.name).to appear_before(@katie.name)
            expect(@zola.name).to_not appear_before(@katie.name)
          end
      end
    end
  end
end