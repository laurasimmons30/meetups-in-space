class Category < ActiveRecord::Base
  validates :category, presence: true 
  has_many :categorizations
  has_many :meetups, :through => :categorizations
end
