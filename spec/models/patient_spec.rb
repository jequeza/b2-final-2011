require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "class methods" do
    describe "::patients_by_age" do
      it "returns list of patients ordered by age" do
        @katie = Patient.create!(name: "Katie Bryce", age: 24)
        @denny = Patient.create!(name: "Denny Duquette", age: 39)
        @rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
        @zola = Patient.create!(name: "Zola Shepherd", age: 2)
        expect(Patient.patients_by_age.first).to eq(@denny)
        expect(Patient.patients_by_age.last).to eq(@zola)
      end
    end
  end
end
