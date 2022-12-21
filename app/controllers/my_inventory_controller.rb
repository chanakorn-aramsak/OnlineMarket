class MyInventoryController < ApplicationController
  before_action :is_logined
  before_action :role, :authorization

  def authorization
    if (@myrole == 'admin' || @myrole == 'seller')
    
    else
      redirect_to '/permission'
    end
  end

  def index
    @user_id = session[:user_id]          
    @myItem = Market.where(user_id: @user_id).all
    @user_type = User.find(@user_id).user_type
    session[:previous_page] = '/my_inventory'
  end

  def destroy_item 
    @item = Item.find(params[:id])
    @item
    Market.destroy_by(item_id: params[:id])
    Inventory.destroy_by(item_id: params[:id])
    @item.destroy

    redirect_to '/my_inventory', notice: 'Delete succesfully'
  end

  def create
    @item = Item.new
  end

  def newItem
    # @name = params[:item][:name]
    # @category = params[:item][:category]

    # @item = Item.new
    # @item.name = @name
    # @item.category = @category
    # @item.enable = false
    # @item.lock_version = params[:item][:lock_version]
    # @item.picture.attach(params[:item][:picture])        # PROBLEM: Picture doesn't show
    # uploaded_file = params[:item][:picture]

    # @item.save
    
    # @market = Market.new
    # @market.user_id = session[:user_id]
    # @market.item_id = @item.id

    # @price = market_params[:price]
    # @stock = market_params[:stock]

    # @market.price = @price
    # @market.stock = @stock
    # @market.save

    # redirect_to '/my_inventory', notice: 'Adding new item succesfully!!!'

  end

  private
    def item_params
      params.require(:item).permit(:name, :category, :enable, :lock_version, :picture)
    end

    def market_params
      params.require(:item).permit(:price, :stock)
    end

end
