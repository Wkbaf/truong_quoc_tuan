require 'rails_helper'
RSpec.describe "Testing user model", type: :request do
  describe User do
    it "has a valid factory" do
      expect(create(:user)).to be_valid
    end
  end

  describe User do
    let!(:user1) { create(:user, email: "user1@test") }
    it "should be uniqueness of email" do
      expect(FactoryBot.build(:user, email: "user1@test")).to be_invalid
    end
  end
end