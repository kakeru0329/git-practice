class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  
  
  private
  def item_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :totle_amount,
    :freight, :payment_method, :name)
  end

end