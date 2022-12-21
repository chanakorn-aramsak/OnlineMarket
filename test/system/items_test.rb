require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
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
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Category", with: @item.category
    check "Enable" if @item.enable
    fill_in "Name", with: @item.name
    fill_in "Price", with: 30
    fill_in "Stock", with: 10
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back to items"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Category", with: @item.category
    check "Enable" if @item.enable
    fill_in "Name", with: @item.name
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back to items"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
