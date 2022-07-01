class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_cost
  belongs_to :prefecture
  belongs_to :send_day

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true
  validates :send_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
end
