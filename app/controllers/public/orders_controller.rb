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
    @order_details = @order.order_details
    @total_price = 0
    @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.freight = 800
    @order.total_amount = @total + @order.freight
    #@address = Address.find(params[:order][:address_id])
    #@order.postal_code = @address.postal_code
    #@order.address = @address.address
    #@order.name = @address.name
    if params[:order][:my_address] == "1" #addressが”1”なら下記ご自身の住所が選ばれたら
      @order.postal_code = current_customer.postal_code #自身の郵便番号をorderの郵便番号に入れる
      @order.address = current_customer.address #自身の住所をorderの住所に入れる
      @order.name = current_customer.last_name+current_customer.first_name #自身の宛名をorderの宛名に入れる

    elsif params[:order][:my_address] ==  "2" #addressが”2”なら下記登録済からの選択が選ばれたら
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code #newページで選ばれた配送先住所idから特定して郵便番号の取得代入
      @order.address = Address.find(params[:order][:address_id]).address #newページで選ばれた配送先住所idから特定して住所の取得代入
      @order.name = Address.find(params[:order][:address_id]).name #newページで選ばれた配送先住所idから特定して宛名の取得代入
    else
    #elsif params[:order][:my_addresss] ==  "3" #addressが”3”新しいお届け先が選ばれたら
      #@address = Address.new #変数の初期化
      #@address.address = params[:order][:address_id] #newページで新しいお届け先に入力した住所を取得代入
      #@address.name = params[:order][:name] #newページで新しいお届け先に入力した宛名を取得代入
      #@address.postal_code = params[:order][:postal_code] #newページで新しいお届け先に入力した郵便番号を取得代入
      #@address.current_customer_id = current_customer.id #newページで新しいお届け先に入力したidを取得代入
      #if @address.save #保存
        #@order.postal_code = @address.postal_code #上記で代入された郵便番号をorderに代入
        #@order.address = @address.address #上記で代入された住所をorderに代入
        #@order.name = @address.name #上記で代入された宛名をorderに代入
      #else
        #render new
      #end
    end
  end

  def create
    @order = Order.new(order_params) #初期化代入
    @order.customer_id = current_customer.id #自身のidを代入
    @order.save
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_detail = OrderDetail.new #初期化宣言
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.price = (cart_item.item.price * 1.1).floor #消費税込みに計算して代入
      @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存
    end
    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to order_conplete_path
  end



  def conplete
  end

  private

    def order_params
      params.require(:order).permit(:name, :address, :postal_code, :payment_method, :total_amount, :freight)
    end

    #def address_params
     # params.require(:order).permit(:postal_code, :address, :name)
    #end


end