class Stop < ActiveRecord::Base

  acts_as_mappable :lat_column_name => :lat,
                   :lng_column_name => :lon
 
  validates :lat, :lon, presence:true
  validates :lat, :lon, numericality:true

end
