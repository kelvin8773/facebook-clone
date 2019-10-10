# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  fixtures :friendships, :users

  context 'validation tests' do
    it ' ensures that current_user.id is present' do
      friend1 = friendships(:kelvin)
      friend1.user_id = ''
      expect(friend1.valid?).to eql(false)
    end

    it 'ensures that the friend_id is present' do
      current_user = users(:bright)
      # user1 = users(:emeka)
      @friend = current_user.friendships.build(friend_id: '')
      expect(@friend.valid?).to eql(false)
    end

    it 'ensures that the friendship creation  is successful' do
      current_user = users(:bright)
      user1 = users(:emeka)
      @friend = current_user.friendships.build(friend_id: user1.id)
      expect(@friend.valid?).to eql(true)
    end
  end

  context 'friendship relate methods' do
    before :each do
      @user1 = users(:bright)
      @user2 = users(:emeka)
      @user3 = users(:kelvin)
      Friendship.create!(user_id: @user1.id, friend_id: @user2.id)
    end

    it 'including pending friends & friends after create friendship' do
      expect(@user1.pending_friends.include?(@user2)).to eql(true)
      expect(@user2.friend_requests.include?(@user1)).to eq true

      @user2.confirm_friend(@user1)
      expect(@user2.friends.include?(@user1)).to eq true
    end

    it 'check friends? working' do
      @user2.confirm_friend(@user1)
      expect(@user1.friend?(@user2)).to eq true
      expect(@user2.friend?(@user1)).to eq true
    end

    it 'check for mutual friends' do
      Friendship.create!(user_id: @user1.id, friend_id: @user3.id)
      Friendship.create!(user_id: @user2.id, friend_id: @user3.id)
      @user2.confirm_friend(@user1)
      @user3.confirm_friend(@user1)
      @user3.confirm_friend(@user2)

      expect(@user1.mutual_friends?(@user3)).to  eq true
      expect(@user3.mutual_friends?(@user1)).to  eq true    
    end
  end
end
