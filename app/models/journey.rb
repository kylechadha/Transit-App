class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  has_many :alerts

  # Need some help here...in the right direction but still not
  # recognizing alert_distance_integer as a method on class
  def self.alert_distance_integer
    if self.alert_distance = '500 meters'
      self.alert_distance_integer = 500;
    elsif self.alert_distance = '1000 meters'
      self.alert_distance_integer = 1000;
    else 1500;
    end
  end

end