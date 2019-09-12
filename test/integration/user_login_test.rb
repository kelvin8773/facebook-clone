require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:michael)
  end

  test "Have to login in root page" do
    get root_url
    assert_select 'a[href=?]', new_user_session_path, count: 2
    assert_select 'a[href=?]', new_user_registration_path, count: 1
  end
end
