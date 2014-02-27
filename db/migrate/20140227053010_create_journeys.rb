class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
