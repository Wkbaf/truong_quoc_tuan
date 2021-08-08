class Product < ApplicationRecord
  belongs_to :store
  belongs_to :user

  validates :store, presence: true

  CSV_HEADERS = %w(store_id name price quantity variant description)
end
