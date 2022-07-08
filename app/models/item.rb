class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_cost
  belongs_to :prefecture
  belongs_to :send_day

  with_options presence: true do
    validates :product_name
    validates :explanation
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: /\A[0-9]+\z/} 
    validates :image
  end
  with_options presence: true, numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :send_cost_id
    validates :prefecture_id
    validates :send_day_id
  end
end
