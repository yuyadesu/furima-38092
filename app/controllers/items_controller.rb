class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at desc")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :condition_id, :price, :send_cost_id, :prefecture_id, :send_day_id).merge(user_id: current_user.id)
  end
end
