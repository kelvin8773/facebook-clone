require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  fixtures :users

  before :each do 
    @user1 = users(:bright)
    @user2 = users(:emeka)
  end

  describe "create#post" do
    it "create new friendship" do
      params = ActionController::Parameters.new(frienship: {user_id: @user1.id, friend_id: @user2.id})
      user_params = FriendshipsController::UserParams.build(params)
      post :create, user_params
      expect(Friendship.where(user_id: @user1.id, friend_id: @user2.id)).not_to eq(nil)
    end
  end

end
