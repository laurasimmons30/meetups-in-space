class Meetup < ActiveRecord::Base
  validates :name, presence: true
 
  validates :description, presence: true

  has_many :categorizations
  has_many :categories, :through => :categorizations
 

  has_many :usermeetups
  has_many :users, :through => :usermeetups

  belongs_to :location
end
