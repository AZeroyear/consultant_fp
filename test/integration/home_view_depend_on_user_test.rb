require 'test_helper'

class HomeViewDependOnUserTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(name: "Example User", email: "example@example.com")
  end

  test "user not logged in" do
    get root_path
    assert_select 'h1', text: "ファイナンシャルプランナーに相談しよう!!"
  end

  test "user logged in" do
    @user = users(:user)
    log_in_as @user
    get root_path
    assert_match @user.name, response.body
  end

  test "fp user logged in" do
    @user = users(:fp_user)
    log_in_as @user
    get root_path
    assert_match "For Financial Planner", response.body
  end
end
