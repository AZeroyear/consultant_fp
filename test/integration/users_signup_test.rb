require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name: "Example User", email: "example@example.com")
  end

  test "Invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params:{ user: {name:"" }}
    end
    assert_template 'users/new'
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.email} }
    assert is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    assert_not is_logged_in?
  end

  test "edit and update" do
    get login_path
    post login_path, params: { session: { email: @user.email} }
    assert is_logged_in?
    get edit_path
    patch edit_path, params: { user: { name: "test test", email: "testtest@test.com" } }
    assert_equal "test test", current_user.name
    assert_equal "testtest@test.com", current_user.email
  end
end
