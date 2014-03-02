class AddHeadsignToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :outbound, :string
    add_column :routes, :inbound, :string
  end
end
