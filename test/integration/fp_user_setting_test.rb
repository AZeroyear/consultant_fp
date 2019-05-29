require 'test_helper'

class FpUserSettingTest < ActionDispatch::IntegrationTest
  def setup
    @fp_user = users(:fp_user)
    @user = users(:user)
  end

  test "access_to_reserversion_page_only_fp_user" do
    get '/reserves'
    assert_redirected_to root_url
    log_in_as @user
    get '/reserves'
    assert_redirected_to root_url
  end

  #test "access_to_reserversion_page_and_update_by_fp_user" do
    #log_in_as @fp_user
    #get reserves_path
    #assert_template 'reserves/index'
    #assert_difference '@fp_user.fp_reserves.count', 5 do
    #  post reserves_path, params: { "user"=>{"fp_reserf_ids"=>["", "57", "58", "59", "61", "62"]} }
    #end
  #end

end
