require 'rails_helper'

RSpec.describe FlightPassanger, type: :model do
  it {should belong_to :flight}
it {should belong_to :passanger}
end
