require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:car) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:city) }
    it { should validate_numericality_of(:duration).is_greater_than_or_equal_to(1) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:car) }
  end
end
