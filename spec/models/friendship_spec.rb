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
      user1 = users(:emeka)
      @friend = current_user.friendships.build(friend_id: '')
      expect(@friend.valid?).to eql(false)
    end

    it 'ensures that the friendship creation  is successful' do
      current_user = users(:bright)
      user1 = users(:emeka)
      # friend1 = friendships(:kelvin)
      @friend = current_user.friendships.build(friend_id: user1.id)
      expect(@friend.valid?).to eql(true)
    end
  end

end
