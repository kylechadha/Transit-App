class Alert < ActiveRecord::Base
  belongs_to :journey
  belongs_to :stop_time
end
