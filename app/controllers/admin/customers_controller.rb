class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end



  private
   def customer_params
     params.require(:customer).permit(
       :first_name,:last_name,:kana_first_name,:kana_last_name,
       :postal_code,:address,:phone_number,:email,:is_deleted)
   end

end