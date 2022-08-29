class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new

  end

  def show
  end

  def edit
    @items = Item.find(params[:id])
  end
end
