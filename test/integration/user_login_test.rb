require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:michael)
  end

  test "see logout link after login" do
    get new_user_session_path
    sign_in users(:michael)
    # assert_template 'post/index'
    get root_url
    assert_select 'a[href=?]', destroy_user_session_path
  end
end
