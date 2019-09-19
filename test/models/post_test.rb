# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = @user.posts.build(content: 'Lorem ipsum')
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'content should be present' do
    @post.content = '       '
    assert_not @post.valid?
  end

  test "Post content can't be too short or too long" do
    @post.content = 'x' * 9
    assert_not @post.valid?

    @post.content = 'x' * 301
    assert_not @post.valid?
  end
end
