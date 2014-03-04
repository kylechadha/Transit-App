class StopTime < ActiveRecord::Base
  
  validates :trip_id, :stop_id, :sequence, presence:true
  validates :sequence, numericality:true

  belongs_to :trip
  belongs_to :stop
end
