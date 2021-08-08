class Product < ApplicationRecord
  belongs_to :store

  validates :store, presence: true
end
