require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
  end
  
  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should be long enough' do
    @user.name = 'a' * 4
    assert_not @user.valid?
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'user first/last name' do
    assert_equal 'Michael', @user.first_name
    assert_equal 'smith', @user.last_name

    @user.name = "Kelvin"
    assert_equal 'Kelvin', @user.first_name
    assert_equal 'Kelvin', @user.last_name

  end

end
