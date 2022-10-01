class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
  	# 注文内容の情報を取得しています！
  	@order = Order.find(params[:id])
    # 注文内容の商品を取得しています！
  	@order_detail = @order.order_details

  end

  private
  def item_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :totle_amount,
    :freight, :payment_method, :name)
  end

end