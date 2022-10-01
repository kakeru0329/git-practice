class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
    @quantity = Item.count # quantity => 総量/.count =>カウントメソッド、配列の要素の数を数えるための機能
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

private

    def items_params
      params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
    end
end