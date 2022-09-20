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
    @order.customer_id = current_customer.id #自身のidを代入
    @order.save
    redirect_to order_conplete_path
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def conplete
  end

  private

    def order_params
      params.require(:order).permit(:name, :address, :postal_code,
      :total_amount, :freight, :payment_method)
    end

    def address_params
      params.require(:order).permit(:postal_code, :address, :name)
    end

end
