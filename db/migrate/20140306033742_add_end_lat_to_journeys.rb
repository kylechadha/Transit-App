class AddEndLatToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :end_lat, :float
    add_column :journeys, :end_lon, :float
    add_reference :journeys, :stop, index: true
  end
end
