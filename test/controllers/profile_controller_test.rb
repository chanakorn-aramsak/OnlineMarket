require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end
  
  test "should get index" do
    get '/profile'
    assert_response :success
  end

  test "changing password" do
    get '/profile'
    get '/profile/changePassword', params: { password: "000" }
    assert_redirected_to '/login'
    get '/main'
    assert_redirected_to '/login'   # Must login with new password
    get '/login/create', params: { email: @email, password: "000" }     #Login with new password
    assert_redirected_to '/main'
  end
end
