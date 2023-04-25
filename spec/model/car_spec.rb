require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:car_model) }
    it { should validate_numericality_of(:price_per_day).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:user) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end