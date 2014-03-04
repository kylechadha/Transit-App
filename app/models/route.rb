class Route < ActiveRecord::Base
  
  validates :short_name, :long_name, presence:true

  belongs_to :agency
  has_many :trips
end
