require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"

    @email1 = '1@gmail.com'
    @password1 = "1"

    @email2 = '2@gmail.com'
    @password2 = "2"
  end

  test "visiting the index" do          # Alsi test authentication
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password
    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/login'
    fill_in "email", with: "1111111"
    fill_in "password", with: @password
    click_on "Submit"
    assert_text "Wrong Username"

    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: "111111"
    click_on "Submit"
    assert_text "Wrong Password"
  end

  test "typing" do
    visit '/login'
    fill_in "email", with: "^/#$%@+=-กขีีดืืหฟาทผ่ืสหปาฟทผส"
    fill_in "password", with: "เหๆสทฟืหากืปาไ()*&$%#@$"
    click_on "Submit"
    assert_text "Wrong Username"

    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: "เหๆสทฟืหากืปาไ()*&$%#@$"
    click_on "Submit"
    assert_text "Wrong Password"
  end

  test "authorization_profile" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/profile'
    assert_selector "h1", text: "Profile"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/profile'
    assert_selector "h1", text: "Profile"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/profile'
    assert_selector "h1", text: "Profile"
    #-------------------------
  end

  test "authorization_main" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
    #-------------------------
  end

  test "authorization_my_market" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/my_market'
    assert_selector "h1", text: "My Market Page"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/my_market'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/my_market'
    assert_selector "h1", text: "My Market Page"
    #-------------------------
  end

  test "authorization_purchase_history" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/purchase_history'
    assert_selector "h1", text: "Purchase History"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/purchase_history'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/purchase_history'
    assert_selector "h1", text: "Purchase History"
    #-------------------------
  end

  test "authorization_sale_history" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/sale_history'
    assert_selector "h1", text: "Sale History"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/sale_history '
    assert_selector "h1", text: "Sale History"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/sale_history '
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
  end

  test "authorization_my_inventory" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/my_inventory'
    assert_selector "h1", text: "My Inventory Page"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/my_inventory'
    assert_selector "h1", text: "My Inventory Page"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/my_inventory'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
  end

  test "authorization_top_seller" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/top_seller'
    assert_selector "h1", text: "Top Seller"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/top_seller'
    assert_selector "h1", text: "Top Seller"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/top_seller'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
  end

  test "authorization_users" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/users'
    assert_selector "h1", text: "Users"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/users'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/users'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
  end

  test "authorization_items" do
    #----test for "admin"----
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/items'
    assert_selector "h1", text: "Items"
    #-------------------------
    #----test for "seller"----
    visit '/login'
    fill_in "email", with: @email1
    fill_in "password", with: @password1

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/items'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
    #----test for "buyer"----
    visit '/login'
    fill_in "email", with: @email2
    fill_in "password", with: @password2

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"

    visit '/items'
    assert_selector "h3", text: "Unaccess!!!"
    #-------------------------
  end

end