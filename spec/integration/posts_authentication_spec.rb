require "rails_helper"
require 'rspec/rails'

RSpec.describe "Post authentication", type: :feature do
  fixtures :users

  before do
  @user = User.create!( name: "Bright okike" ,
                              email: "brightokike5@gmail.com", 
                              password: "foobar",
                              password_confirmation: "foobar"  )
    
  end


  it "unsuccessful post creation" do
    visit "/login"
    page.fill_in 'mail2', with: 'brightokike5@gmail.com'
    page.fill_in 'pass2', with: 'foobar'
    click_on('Sign in')

    visit root_url
    page.fill_in 'content', with: 'money'
  
    click_on('Post')

    expect(page).to have_content 'content cant be empty or less than 10 letter'
  end

  it "successful post creation" do
    visit "/login"
    page.fill_in 'mail2', with: 'brightokike5@gmail.com'
    page.fill_in 'pass2', with: 'foobar'
    click_on('Sign in')

    visit root_url
    page.fill_in 'content', with: 'money is good'
  
    click_on('Post')

    expect(page).to have_content 'Post created'
  end

  it "upcoming event & past evetn show in Events index page" do
    visit "/login"
    page.fill_in 'mail2', with: 'brightokike5@gmail.com'
    page.fill_in 'pass2', with: 'foobar'
    click_on('Sign in')
    
    visit root_url
    expect(page).to have_content 'Content'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'All Users'
  end
  


end