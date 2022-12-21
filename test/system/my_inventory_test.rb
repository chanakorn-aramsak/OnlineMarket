require "application_system_test_case"

class MyInventory_Test < ApplicationSystemTestCase
  setup do
    @item = items(:one)
    @myrole = 'seller'
    @email = '1@gmail.com'
    @password = "1"
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
  end

  test "visiting the index" do
    visit "/my_inventory"
    assert_selector "h1", text: "My Inventory Page"
  end

  test "showing table element" do
    visit "/my_inventory"

    assert_selector 'table' do
        assert_selector 'thead' do
            assert_selector 'tr' do
                assert_selector 'th:nth-child(1)',text: 'Name'
                assert_selector 'th:nth-child(2)',text: 'Picture'
                assert_selector 'th:nth-child(3)',text: 'Category'
                assert_selector 'th:nth-child(4)',text: 'Price'
                assert_selector 'th:nth-child(5)',text: 'Stock'
                assert_selector 'th:nth-child(6)',text: "Enable"
                assert_selector 'th:nth-child(7)',text: ""
            end
        end

        assert_selector 'tbody' do
            assert_selector 'tr' do
                assert_selector 'td:nth-child(1)',text: 'oneItem'
                assert_selector 'td:nth-child(2)',text: ''
                assert_selector 'td:nth-child(3)',text: 'one'
                assert_selector 'td:nth-child(4)',text: '1.5'
                assert_selector 'td:nth-child(5)',text: '10'
                assert_selector 'td:nth-child(6)',text: "Approve for sell"
            end
        end
    end
  end

  test "add on item page" do
    visit "/my_inventory"
    click_on "New Items"
    assert_selector "h1", text: "New item"
  end 

  test "add on item" do
    visit "/my_inventory"
    click_on "New Items"
    assert_selector "h1", text: "New item"

    fill_in "Category", with: @item.category
    fill_in "Name", with: @item.name
    fill_in "Price", with: Market.where(item_id: @item.id).first.price
    fill_in "Stock", with: Market.where(item_id: @item.id).first.stock
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back to Inventory"
  end 

  test "edit information" do
    visit "/my_inventory"
    visit "markets/980190962/edit"
    fill_in "Price", with: 999.99
    fill_in "Stock", with: 99

    click_on "Update Market"
    assert_text "Market was successfully updated."

    visit "items/980190962/edit"
    fill_in "Name", with: 'NewItem'
    fill_in "Category", with: 'Neww'

    click_on "Update Item"
    assert_text "Item was successfully updated."
  end

end