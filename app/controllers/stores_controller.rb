class StoresController < ApplicationController
  before_action :set_store, only: [:destroy, :edit, :update]

  def index
    store = Store.new

    render locals: {store: store}
  end

  def get_list_stores
    stores = Store.where(user_id: current_user.id)
    stores_mapping = stores.map do |store|
      {
        "name":    store.name,
        "phone":   store.phone,
        "address": store.address,
        "store_id": store.id
      }
    end

    render json: stores_mapping
  end

  def create
    ActiveRecord::Base.transaction do
      store = Store.new(store_params)
      store.user = current_user
      if store.save!
        flash[:notice] = "Create successfully"
      else
        flash[:alert] = "Create failed"
      end

      redirect_to stores_path
    end
  rescue => exception
    Rails.logger.info "Error cannot create store #{exception.message}\n\n"
    flash[:alert] = "Create failed"
    redirect_to stores_path
  end

  def edit
    render locals: {store: @store}
  end

  def update
    ActiveRecord::Base.transaction do
      @store.user = current_user
      if @store.update!(store_params)
        flash[:notice] = "Update successfully"
      else
        flash[:alert] = "Update failed"
      end

      redirect_to stores_path
    end
  rescue => exception
    Rails.logger.info "Error cannot update store #{exception.message}\n\n"
    flash[:alert] = "Update failed"
    redirect_to stores_path
  end

  def destroy
    if @store.destroy
      flash[:notice] = "Delete successfully"
    else
      flash[:alert] = "Delete failed"
    end

    redirect_to stores_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :phone, :address)
  end
end
