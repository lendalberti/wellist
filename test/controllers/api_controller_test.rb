require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @user        = users(:one) 
    @user2       = users(:two) 
    @new_vendor  = vendors(:new)
    @wellist     = wellists(:one)
  end

  # show user wellist
  test "show user wellist" do
    get home_url(@user.id)
    find_text_in_form( @user.fullname )
  end

  # add vendor to wellist
  test 'add new vendor to our wellist' do
    assert_difference('Wellist.count') do
      post api_add_vendor_url, params: { user_id: @user2.id, vendor_id: @new_vendor.id, public_list: true, public_vendor: true }
      assert_response :success
    end

    # duplicate not allowed
    assert_no_difference('Wellist.count') do
      post api_add_vendor_url, params: { user_id: @user2.id, vendor_id: @new_vendor.id, public_list: true, public_vendor: true }
      assert_response :success
    end
  end

  # remove vendor from wellist
  test 'remove vendor from our wellist' do
    assert_difference('Wellist.count', -1) do
      delete api_remove_vendor_url, params: { wellist_id: @wellist.id}
      assert_response :success
    end
  end

  # hide wellist from public wellists - - api_toggle_vendor
  test 'hide wellist from public wellists' do
    get home_url(@user.id)
    post api_toggle_vendor_url, params: { list: true, user: @user.id, item_id: @user.id }
    assert_response :success
    public_wellists = Wellist.where( public_list: true )
    assert public_wellists.exclude?(@wellist)
  end

  # hide vendor from public wellists - api_toggle_vendor
  test 'hide vendor from public wellists' do
    get home_url(@user.id)
    post api_toggle_vendor_url, params: { list: false, user: @user.id, item_id: @wellist.id }
    assert_response :success

    public_wellists = Wellist.where( public_vendor: true )
    assert public_wellists.exclude?(@wellist)
  end

 

end

