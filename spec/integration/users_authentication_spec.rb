require "rails_helper"
require 'rspec/rails'

RSpec.describe "User authentication", type: :feature do
  fixtures :users

  before do
    @user = User.create!( name: "Bright okike" ,
                              email: "brightokike5@gmail.com", 
                              password: "foobar",
                              password_confirmation: "foobar"  )
  end

  it "ensures it displays the sign up page correctly" do
    visit '/signup/new'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Email'
  end

  it "sucessful login" do
    visit '/login'
    page.fill_in 'mail2', with: 'brightokike5@gmail.com'
    page.fill_in 'pass2', with: 'foobar'
    click_on('Sign in')

    expect(page).to have_content 'Signed in successfully'
  end

  it "unsucessful login" do
    visit '/login'
    page.fill_in 'mail2', with: 'exmaple2@gmail.com'
    page.fill_in 'pass2', with: 'foobar'
    click_on('Sign in')

    expect(page).to have_content 'Invalid Email or password'
  end

   it "sucessful logout" do
    visit '/login'
    page.fill_in 'mail2', with: 'brightokike5@gmail.com'
    page.fill_in 'pass2', with: 'foobar'
    click_on('Sign in')

    click_on('Sign Out')
    expect(page).to have_content 'Signed out successfully'
  end
  


end