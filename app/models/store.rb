class Store < ApplicationRecord
  has_many :products
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
