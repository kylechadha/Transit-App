class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :alert_type
      t.string :alert_distance
      t.references :journey, index: true
      t.references :stop_time, index: true

      t.timestamps
    end
  end
end
