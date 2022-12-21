require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    # post items_url, params: { item: { category: @item.category, enable: @item.enable, name: @item.name } }
    get '/items'
    assert_response :success
  end

  test "should get new" do
    #get new_item_url
    get '/items/new'
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { category: @item.category, enable: @item.enable, name: @item.name, 
      price: Market.where(item_id: @item.id).first.price, stock: Market.where(item_id: @item.id).first.stock } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { category: @item.category, enable: @item.enable, name: @item.name,
    price: Market.where(item_id: @item.id).first.price, stock: Market.where(item_id: @item.id).first.stock } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end
  end

  test "locking" do
    i1 = Item.find(items(:one).id)
    i2 = Item.find(items(:one).id)

    i1.name = "item1"
    i1.save

    assert_raises("Attempted to update a stale object: Inventory.") do
      i2.name = "item2"
      i2.save
    end
  end

end
