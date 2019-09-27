# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'

RSpec.describe 'User authentication', type: :feature do
  fixtures :users

  before do
    @user = User.create!(name: 'Bright okike',
                         email: 'brightokike5@gmail.com',
                         password: 'foobar',
                         password_confirmation: 'foobar')
  end

  it 'ensures it displays the sign up page correctly' do
    visit '/signup/new'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'It is easy and quick!!'
    expect(page).to have_button 'Sign up'
  end

  it 'sucessful login' do
    visit '/login'
    page.fill_in 'signin_email', with: 'brightokike5@gmail.com'
    page.fill_in 'signin_password', with: 'foobar'
    click_on('Sign In')

    expect(page).to have_content 'Signed in successfully'
  end

  it 'unsucessful login' do
    visit '/login'
    page.fill_in 'signin_email', with: 'exmaple2@gmail.com'
    page.fill_in 'signin_password', with: 'foobar'
    click_on('Sign In')

    expect(page).to have_content 'Invalid Email or password'
  end

  it 'sucessful logout' do
    visit '/login'
    page.fill_in 'signin_email', with: 'brightokike5@gmail.com'
    page.fill_in 'signin_password', with: 'foobar'
    click_on('Sign In')

    click_on('Sign Out')
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
