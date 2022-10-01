class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_amount = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @old_cart_item = CartItem.find_by(item: @cart_item.item)
    if @old_cart_item.present? and @cart_item.valid?
      @cart_item.amount += @old_cart_item.amount
      @old_cart_item.destroy
    end
    if @cart_item.save
      redirect_to cart_items_path
    else
      render index
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
	  redirect_to cart_items_path
  end

	def destroy_all
		@cart_items = current_customer.cart_items
		@cart_items.destroy_all
	  redirect_to cart_items_path
	end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end