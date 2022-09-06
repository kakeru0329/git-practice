class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "商品詳細の変更が完了しました。"
       redirect_to customer_path(@customer.id)
    else
       flash[:notice] = "商品詳細の変更内容に不備があります。"
       render :edit
    end
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
    :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end

end