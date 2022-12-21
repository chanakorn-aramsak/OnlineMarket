require "test_helper"

class MyInventoryControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @myrole = 'seller'
    @email = '1@gmail.com'
    @password = "1"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get '/my_inventory'
    assert_response :success
  end

  test "should destroy item1" do
    assert_difference("Item.count", -1) do
      get "/my_inventory/destroy_item", params: { id: 980190962 }
    end
  end

  test "should destroy item2" do
    assert_difference("Market.count", -1) do
      get "/my_inventory/destroy_item", params: { id: 980190962 }
    end
  end

  test "should destroy item3" do
    assert_difference("Inventory.count", -3) do       #They are now has item_id = '980190962' 2 items in inventory
      get "/my_inventory/destroy_item", params: { id: 980190962 }
    end
  end

  test "create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { category: @item.category, enable: @item.enable, name: @item.name, 
      price: Market.where(item_id: @item.id).first.price, stock: Market.where(item_id: @item.id).first.stock } }
    end
    assert_redirected_to item_url(Item.last)

    assert_difference("Market.count") do
      post items_url, params: { item: { category: @item.category, enable: @item.enable, name: @item.name, 
      price: Market.where(item_id: @item.id).first.price, stock: Market.where(item_id: @item.id).first.stock } }
    end

  end  

  test "edit item" do
    patch item_url(@item), params: { item: { category: @item.category, enable: @item.enable, name: @item.name,
      price: Market.where(item_id: @item.id).first.price, stock: Market.where(item_id: @item.id).first.stock } }
    assert_redirected_to item_url(@item)

    @market = Market.where(item_id: @item.id).first 
    patch market_url(@market), params: { market: { item_id: @market.item_id, price: @market.price, stock: @market.stock, user_id: @market.user_id } }
    assert_redirected_to market_url(@market)
  end
end
