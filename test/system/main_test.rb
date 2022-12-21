require "application_system_test_case"

class MainTest < ApplicationSystemTestCase
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"

    @email1 = '1@gmail.com'
    @password1 = "1"

    @email2 = '2@gmail.com'
    @password2 = "2"

    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password
    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

  end

  test "visiting the index" do 
    visit '/main'
    assert_selector "h1", text: "Main Page of LAZADAE"
  end

  test "clicking button" do
    visit '/main'
    click_on "Profile"
    assert_selector "h1", text: "Profile"

    visit '/main'
    click_on "My Market"
    assert_selector "h1", text: "My Market Page"

    visit '/main'
    click_on "Purchase History"
    assert_selector "h1", text: "Purchase History"

    visit '/main'
    click_on "My Inventory"
    assert_selector "h1", text: "My Inventory Page"

    visit '/main'
    click_on "Top Seller"
    assert_selector "h1", text: "Top Seller"

    visit '/main'
    click_on "Users"
    assert_selector "h1", text: "Users"

    visit '/main'
    click_on "Items"
    assert_selector "h1", text: "Items"

    visit '/main'
    click_on "Log Out"
    assert_selector "h1", text: "Login Page"
  end

end