require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "email@email.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should be less than 51" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email, name should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "fp should be false" do
    @user.save
    assert_equal false, @user.fp
  end

end
