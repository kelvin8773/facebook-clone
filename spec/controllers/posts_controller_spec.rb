# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  fixtures :users

  describe 'GET #new' do
    it 'returns http success' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in users(:bright)
      expect(response).to have_http_status(:success)
      sign_out users(:bright)
      get :new
      expect(response).to have_http_status(302)
    end
  end
end
