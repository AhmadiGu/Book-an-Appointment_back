class User < ApplicationRecord
    has_many :reservations
    has_many :cars, through: :reservations

    validates :user_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }
end
