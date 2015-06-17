class Location < ActiveRecord::Base
  validates :location, presence: true 
  has_many :meetups
end
