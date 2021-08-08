class ProductsController < ApplicationController

  def create
    store = Store.find(store_params[:store_id])
    product = Product.new(product_params)
    product.store = store
    product.user = current_user
    product.save
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :variant, :description)
  end

  def store_params
    params.require(:product).permit(:store_id)
  end
end
