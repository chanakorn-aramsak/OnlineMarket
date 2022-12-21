require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "should create inventory" do
    visit inventories_url
    click_on "New inventory"

    fill_in "Price", with: @inventory.price
    fill_in "Qty", with: @inventory.qty
    fill_in "Seller", with: @inventory.seller_id
    fill_in "User", with: @inventory.user_id
    fill_in "Item", with: items(:one).id
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "should update Inventory" do
    visit inventory_url(@inventory)
    click_on "Edit this inventory", match: :first

    fill_in "Price", with: @inventory.price
    fill_in "Qty", with: @inventory.qty
    fill_in "Seller", with: @inventory.seller_id
    fill_in "User", with: @inventory.user_id
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory" do
    visit inventory_url(@inventory)
    click_on "Destroy this inventory", match: :first

    assert_text "Inventory was successfully destroyed"
  end
end
