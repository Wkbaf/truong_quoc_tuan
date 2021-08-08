class AddUserIdToStore < ActiveRecord::Migration[6.1]
  def change
    add_reference :stores, :user, index: true
  end
end
