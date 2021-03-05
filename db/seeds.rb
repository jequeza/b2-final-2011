# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



vacation = Flight.create!(number: "1234", date: "06/12/2021", departure_city: "Chicago", arrival_city: "Cancun")
work = Flight.create!(number: "3456", date: "08/03/2020", departure_city: "Miami", arrival_city: "Los Angeles")

jack = vacation.passangers.create!(name: "Jack Wilson", age: 23)
sam = vacation.passangers.create!(name: "Sam Wilson", age: 28)
jordan = vacation.passangers.create!(name: "Jordan Wilson", age: 21)
steve = vacation.passangers.create!(name: "Steve Wilson", age: 16)

phil = work.passangers.create!(name: "Phil Smith", age: 45)
richard = work.passangers.create!(name: "Richard Low", age: 39)
carla = work.passangers.create!(name: "Carla Ramos", age: 40)
angelica = work.passangers.create!(name: "Angelica B", age: 35)


