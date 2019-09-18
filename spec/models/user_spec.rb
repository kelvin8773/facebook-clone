require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new( name: "Bright okike" ,
                            email: "brightokike4@gmail.com", 
                            password: "foobar",
                            password_confirmation: "foobar"  )

  end      
  context 'validation tests' do 
    it ' ensures that users name is present' do 
      @user.name = ""
      expect(@user.valid?).to eql(false)
    end

    it 'ensures that the email is present' do 
      @user.email = ""
      expect(@user.valid?).to eql(false)
    end

    it 'ensures that the password confirmation is the same with the entered passord' do 
      @user.password = "foobar"
      @user.password_confirmation = "foo"
      expect(@user.valid?).to eql(false)
    end

    it 'ensures that the user is save successfully ' do 
      expect(@user.valid?).to eql(true)
    end 

  end 

  
end
