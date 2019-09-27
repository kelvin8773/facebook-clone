# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create!(name: 'Bright okike',
                         email: 'brightokike4@gmail.com',
                         password: 'foobar',
                         password_confirmation: 'foobar')

    @post = @user.posts.create!(content: 'this is a post for testing')
    @comment = @user.comments.create!(content: 'great!', post_id: @post.id)
  end

  context 'Like validations' do
    it 'ensure can like a post but not a user' do
      @like_post = @user.likes.build(likeable_type: 'Post', likeable_id: @post.id)

      expect(@like_post.save).to eql(true)
      expect(!@post.liked?(@user).nil?).to eql(true)

      @like_post = @user.likes.build(likeable_type: 'User', likeable_id: @post.id)
      expect(@like_post.save).to eql(false)
    end

    it 'ensure can like a comment' do
      @like_comment = @user.likes.build(likeable_type: 'Comment', likeable_id: @comment.id)

      expect(@like_comment.save).to eql(true)
      expect(!@comment.liked?(@user).nil?).to eql(true)
    end
  end
end
