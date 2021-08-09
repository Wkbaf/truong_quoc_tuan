class HomepageController < ApplicationController
  before_action :authenticate_user!

  def index
    product = Product.new
    stores = Store.where(user_id: current_user.id)

    render locals: {stores: stores, product: product}
  end

  def get_list_products
    products = Product.left_outer_joins(:user).includes(:store).where(user_id: current_user.id)
    products_mapping = products.map do |product|
      {
        "store":       product.store.name,
        "name":        product.name,
        "price":       product.price,
        "quantity":    product.quantity,
        "variant":     product.variant,
        "description": product.description,
        "product_id":  product.id
      }
    end

    render json: products_mapping
  end
end
