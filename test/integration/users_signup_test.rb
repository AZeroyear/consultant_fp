require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name: "Example User", email: "example@example.com")
  end

  test "Invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params:{ user: {name:"" }}
    end
    assert_template 'users/new'
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.name} }
    assert is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    assert_not is_logged_in?
  end
end
