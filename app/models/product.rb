class Product < ApplicationRecord
  belongs_to :store

  validates :store, presence: true

  CSV_HEADERS = %w(store_id name price quantity variant description)
end
