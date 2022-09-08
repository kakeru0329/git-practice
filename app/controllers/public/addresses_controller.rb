class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def edit
  end
end
