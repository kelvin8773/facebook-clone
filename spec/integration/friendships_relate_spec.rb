# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'

RSpec.describe 'friendships process', type: :feature do
  fixtures :users
  
  before :each do
    @user1 = User.create!(name: 'Bright okike',
                          email: 'brightokike5@gmail.com',
                          password: 'foobar',
                          password_confirmation: 'foobar')

  end
  
  it "request a friendship" do
    visit '/login'
    page.fill_in 'signin_email', with: 'brightokike5@gmail.com'
    page.fill_in 'signin_password', with: 'foobar'
    click_on('Sign In')

    visit users_index_path
    # click_on("Add As Friend")
    first(:text, "Add As Friend").click
    expect(page).to have_content "Friend request sent"
  
  end
  



end