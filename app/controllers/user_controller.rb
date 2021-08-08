class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    store = Store.new
    product = Product.new
    stores = Store.all

    render locals: {store: store, stores: stores, product: product}
  end

  def get_list_products
    products = Product.all
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

    puts "products_mapping #{products_mapping.inspect}\n\n\n\n"

    render json: products_mapping
  end
end
