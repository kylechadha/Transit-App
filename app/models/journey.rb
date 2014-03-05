class Journey < ActiveRecord::Base
  
  validates :name, presence:true
  validates :name, uniqueness:true

  belongs_to :user
  has_many :alerts
end
