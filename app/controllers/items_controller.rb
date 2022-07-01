class ItemsController < ApplicationController

  def index
  end

  def new
  end

  private

  def message_params
    # item に画像を保存するカラムがない。ついかするか？テーブル設計の時ok出ているから別の方法か？
    # params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
