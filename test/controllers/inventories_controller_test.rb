require "test_helper"

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference("Inventory.count") do
      post inventories_url, params: { inventory: { price: @inventory.price, qty: @inventory.qty, seller_id: @inventory.seller_id, user_id: @inventory.user_id, item_id: items(:one).id } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { price: @inventory.price, qty: @inventory.qty, seller_id: @inventory.seller_id, user_id: @inventory.user_id } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference("Inventory.count", -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end

  test "locking" do
    i1 = Inventory.find(inventories(:one).id)
    i2 = Inventory.find(inventories(:one).id)

    i1.price = "10"
    i1.save

    assert_raises("Attempted to update a stale object: Inventory.") do
      i2.price = "11"
      i2.save
    end
  end
end
