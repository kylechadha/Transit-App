class AddDirectionToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :direction, :string
    add_column :journeys, :start_lat, :float
    add_column :journeys, :start_lon, :float
    add_reference :journeys, :trip, index: true
  end
end
