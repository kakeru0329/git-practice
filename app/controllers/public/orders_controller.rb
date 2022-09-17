class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart_item = item.find(params[:id])
    
    redirect_to order_conplete_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method])
  end

  def conplete
  end

  private

    def orders_params
      params.require(:order).permit(:name, :address, :postal_code,
      :total_amount, :freight, :payment_method)
    end

    def address_params
      params.require(:order).permit(:postal_code, :address, :name)
    end

end
