class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id

  # CARD_NUMBER_REGEX = /\A\d{14,16}\z/
  # YAER_REGEX = /\A\d{2}\z/                                                                                                                                                                              
  # MONTH_REGEX = /\A\d{2}\z/                                                                                                                                                                             
  # CVV_REGEX = /\A\d{3,4}\z/ 
  # with_options presence: true do
  # end
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A0\d{10,11}$\z/}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, purchase_id: purchase.id)
  end
end