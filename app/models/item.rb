class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :price, presence: true
  validates :send_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :send_day_id, presence: true
end
