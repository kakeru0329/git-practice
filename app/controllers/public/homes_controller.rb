class Public::HomesController < ApplicationController

  def top
     @items = Item.limit(4).offset(0) # 先頭から5つのレコードから８つを取得
  end

  def about
  end
end
