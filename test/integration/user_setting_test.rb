require 'test_helper'

class UserSettingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user)
  end

  test "access to consultatnt page only user" do
    get '/consultants'
    assert_redirected_to login_url
  end

  test "reserve by user" do
    log_in_as @user
    get '/consultants'
    assert_template 'consultants/index'
    #patch consultant_path(consultants(:consultant_1))
    #assert_redirected_to root_url
    #assert_match "1件の予約をしています。", response.body
  end
end
