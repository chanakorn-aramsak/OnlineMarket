class MyMarketController < ApplicationController
  before_action :is_logined
  before_action :role, :authorization
  def authorization
    if (@myrole == 'admin' || @myrole == 'buyer')
    
    else
      redirect_to '/permission'
    end
  end

  def index
    @user_id = session[:user_id]
    @myItem = Item.where(enable: true).all
  end

  def buy
    @want_to_buy = params[:buying].to_i
    @item_id = params[:item_id]
    @market = Market.where(item_id: @item_id).first
    @current_stock = @market.stock
    if (@want_to_buy > @current_stock)
      redirect_to '/my_market', notice: "out of stock"
    else
      @market.stock = @current_stock - @want_to_buy
      @market.save

      @inventory = Inventory.new
      @inventory.user_id = session[:user_id]
      @inventory.seller_id = @market.user_id
      @inventory.price = @market.price
      @inventory.qty = @want_to_buy
      @inventory.item_id = @item_id
      @inventory.save

      redirect_to '/my_market', notice: "Completly buying ;)"
    end
  end
end
