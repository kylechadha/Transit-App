class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  has_many :alerts
end
