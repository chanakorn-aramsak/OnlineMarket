require "test_helper"

class TopSellerControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get '/top_seller'
    assert_response :success
  end

  test "specify date caseOK" do
    get '/top_seller/calculate', params: { start_date: '05/12/2022', end_date: '07/12/2022' }
    assert_response :redirect
  end

  test "specify date caseERROR" do
    get '/top_seller/calculate', params: { start_date: '09/12/2022', end_date: '07/12/2022' }
    assert_response :redirect
  end

end
