class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :edit, :update, :show]
  before_action :set_stores, only: [:edit]

  def create
    ActiveRecord::Base.transaction do
      store = Store.find(store_params[:store_id])
      product = Product.new(product_params)
      product.store = store
      product.user = current_user
      if product.save!
        flash[:notice] = "Create successfully"
      else
        flash[:alert] = "Create failed"
      end

      redirect_to root_path
    end
  rescue => exception
    Rails.logger.info "Error cannot create product #{exception.message}\n\n"
    flash[:alert] = "Create failed"
    redirect_to root_path
  end

  def show
    store = @product.store
    render locals: {product: @product, store: store}
  end

  def edit
    render locals: {stores: @stores, product: @product}
  end

  def update
    ActiveRecord::Base.transaction do
      store = Store.find(store_params[:store_id])
      @product.store = store
      @product.user = current_user
      if @product.update!(product_params)
        flash[:notice] = "Update successfully"
      else
        flash[:alert] = "Update failed"
      end

      redirect_to root_path
    end
  rescue => exception
    Rails.logger.info "Error cannot update product #{exception.message}\n\n"
    flash[:alert] = "Update failed"
    redirect_to root_path
  end

  def destroy
    if @product.destroy
      flash[:notice] = "Delete successfully"
    else
      flash[:alert] = "Delete failed"
    end

    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_stores
    @stores = Store.where(user_id: current_user.id)
  end

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :variant, :description)
  end

  def store_params
    params.require(:product).permit(:store_id)
  end
end
