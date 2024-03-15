class Filter < ApplicationRecord
  has_many :products, foreign_key: 'product_details', primary_key: 'name'

  validates :name, presence: true, uniqueness: true
end
