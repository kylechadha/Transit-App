class Journey < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  has_many :alerts

  def self.destination(id)
    Stop.find(id)
  end
end
