# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  fixtures :users

  describe 'GET #create' do
    it 'returns http success' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in users(:bright)
      current_user = users(:bright)
      user1 = users(:emeka)
      current_user.friendships.build(friend_id: user1.id)
      expect(response).to have_http_status(200)
    end
  end
end
