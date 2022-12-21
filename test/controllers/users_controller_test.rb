require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
    get '/login/create', params: { email: @email, password: @password }
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do        #It cannot create new user if the email is exist
    assert_difference("User.count") do
      post users_url, params: { user: { email: "try@gmail.com", name: @user.name, password: "try", user_type: @user.user_type } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest, user_type: @user.user_type } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    @user = users(:buyer)
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "locking" do
    i1 = User.find(users(:admin).id)
    i2 = User.find(users(:admin).id)

    i1.name = "name1"
    i1.save

    assert_raises("Attempted to update a stale object: Inventory.") do
      i2.name = "name2"
      i2.save
    end
  end

end
