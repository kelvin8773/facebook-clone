require "rails_helper"

RSpec.describe "User authentication", type: :feature do
  
  before do
    @user = User.create!( name: "Bright okike" ,
                              email: "brightokike4@gmail.com", 
                              password: "foobar",
                              password_confirmation: "foobar"  )
  end

  it "upcoming event & past evetn show in Events index page" do
    visit '/signup/new'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Email'
  end
  


end