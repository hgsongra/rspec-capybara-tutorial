require 'rails_helper'

RSpec.feature "User Signup" do
	
	scenario 'with valid details' do
		visit "/"	  
		click_link "Sign Up"
		fill_in "Email", with: "hgsongra@gmail.com"
		fill_in "Password", with: "Password"
		fill_in "Password confirmation", with: "Password"
		click_button "Sign up"
		expect(page).to have_content("You have signed up successfully")
	end	

end