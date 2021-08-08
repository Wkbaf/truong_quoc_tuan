class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    store = Store.new
    product = Product.new
    stores = Store.where(user_id: current_user.id)

    render locals: {store: store, stores: stores, product: product}
  end

  def get_list_products
    products = Product.joins(store: :user).where("users.id = ?", current_user.id) 
    products_mapping = products.map do |product|
      {
        "store": product.store.name,
        "name": product.name,
        "price": product.price,
        "quantity": product.quantity,
        "variant": product.variant,
        "description": product.description
      }
    end

    render json: products_mapping
  end
end
