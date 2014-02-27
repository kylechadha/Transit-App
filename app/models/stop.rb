class Stop < ActiveRecord::Base

  validates :lat, :lon, presence:true
  validates :lat, :lon, numericality:true

end
