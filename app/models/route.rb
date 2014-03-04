class Route < ActiveRecord::Base
  belongs_to :agency
  has_many :trips

  # If you want to change the URL that is displayed to a user, you can change "to_param"
  # def to_param
  #   gtfs_route_id
  # end
end
