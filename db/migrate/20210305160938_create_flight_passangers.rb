class CreateFlightPassangers < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_passangers do |t|
      t.references :flight, foreign_key: true
      t.references :passanger, foreign_key: true

      t.timestamps
    end
  end
end
