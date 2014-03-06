class AddAlertDistanceToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :alert_distance, :string
    add_column :journeys, :alert_type, :string
  end
end
