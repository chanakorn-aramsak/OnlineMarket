require "application_system_test_case"

class ProfileTest < ApplicationSystemTestCase
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
    visit '/profile'
    assert_selector "h1", text: "Profile"
  end

  test "showing right information" do 
    visit '/profile'
    assert_selector "h1", text: "Profile"
    assert_selector "p", text: "User_id: 135138680"
    assert_selector "p", text: "Email: 0@gmail.com"
    assert_selector "p", text: "Name: 001"
    assert_selector "p", text: "Role: Admin"
  end

end