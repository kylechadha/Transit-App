class Alert < ActiveRecord::Base

  validates :alert_distance, :journey_id, :stop_time_id, presence:true
  validates :alert_distance, numericality:true

  belongs_to :journey
  belongs_to :stop_time

  has_many :stops, through: :stop_times
  has_many :trips, through: :stop_times
  has_many :routes, through: :trips
  has_many :agencies, through: :routes

end
