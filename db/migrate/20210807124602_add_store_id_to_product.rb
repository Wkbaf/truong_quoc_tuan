class AddStoreIdToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :store, index: true
  end
end
