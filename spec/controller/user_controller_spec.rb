require 'rails_helper'
RSpec.describe "Testing user controller", type: :request do
  describe "list of all products" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let(:store) { create(:store, user: user) }
    let(:store2) { create(:store, user: user2) }
    let!(:product1) { create(:product, store: store, user: user) }
    let!(:product2) { create(:product, store: store2, user: user2) }

    before(:each) do
      sign_in user
    end

    it "requests list of all products" do
      get get_list_products_users_path
      expect(response).to be_successful
    end

    it "expects product count eq to 1" do
      get get_list_products_users_path
      products = JSON.parse(response.body)
      expect(products.count).to eq 1
    end

    it "should be belong to user" do
      get get_list_products_users_path
      products = JSON.parse(response.body)
      expect(products.first["name"]).to eq user.products.first.name
    end

    it "expects user count eq to 2" do
      expect(User.all.count).to eq 2
    end

    it "expects product count eq to 2" do
      expect(Product.all.count).to eq 2
    end
  end
end