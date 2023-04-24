class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car
  
  validates :date, presence: true
  validates :city, presence: true
  validates :duration, numericality: { greater_than_or_equal_to: 1 }
  validates :user, presence: true
  validates :car, presence: true
  
end
