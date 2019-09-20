# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'

RSpec.describe UsersController, type: :controller do
  fixtures :users

  describe 'GET #index' do
    it 'returns http success' do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      sign_in users(:bright)
      expect(response).to have_http_status(200)
    end
  end
end
