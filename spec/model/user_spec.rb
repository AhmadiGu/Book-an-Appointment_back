# This test suite includes tests for validations, associations, and authentication. 
# It assumes the use of FactoryBot for creating test data.
require 'faker'

RSpec.describe User, type: :model do
    subject { build(:user) }
  
    describe "validations" do
      it { should validate_presence_of(:username) }
      it { should validate_length_of(:username).is_at_least(3).is_at_most(70) }
      it { should allow_value("seko@example.com").for(:email) }
      it { should_not allow_value("invalid").for(:email) }
    end
  
    describe "associations" do
      it { should have_many(:reservations) }
    end
  
    describe "authentication" do
      let!(:user) { create(:user, email: "test@example.com", password: "password") }
  
      it "returns the user when the email and password are correct" do
        authenticated_user = User.authenticate("test@example.com", "password")
        expect(authenticated_user).to eq(user)
      end
  
      it "returns nil when the email is incorrect" do
        authenticated_user = User.authenticate("wrong@example.com", "password")
        expect(authenticated_user).to be_nil
      end
  
      it "returns nil when the password is incorrect" do
        authenticated_user = User.authenticate("test@example.com", "wrong_password")
        expect(authenticated_user).to be_nil
      end
    end
  end
  