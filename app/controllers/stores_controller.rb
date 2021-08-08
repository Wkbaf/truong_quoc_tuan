class StoresController < ApplicationController

  def create
    store = Store.new(store_params)
    store.user = current_user
    store.save
    redirect_to root_path
  end

  private
  def store_params
    params.require(:store).permit(:name, :phone, :address)
  end
end
