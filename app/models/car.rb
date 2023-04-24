class Car < ApplicationRecord
  belongs_to :user

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :photo, presence: true
  # validates :car_model, presence: true
  # validates :price_per_day, numericality: { greater_than_or_equal_to: 0 }
  # validates :user, presence: true

end
