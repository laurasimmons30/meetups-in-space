class Meetup < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :date, presence: true
end
