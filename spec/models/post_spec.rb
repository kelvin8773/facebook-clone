# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create!(name: 'Bright okike',
                         email: 'brightokike4@gmail.com',
                         password: 'foobar',
                         password_confirmation: 'foobar')

    @post = @user.posts.build(content: 'this is a post for testing')
  end

  context 'post vadilidation' do
    it 'ensures that the post content is not blank' do
      @post.content = ''
      expect(@post.valid?).to eql(false)
    end

    it 'ensures that the post is successfully created' do
      expect(@post.valid?).to eql(true)
    end
  end
end
