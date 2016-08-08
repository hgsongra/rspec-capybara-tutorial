require 'rails_helper'

RSpec.feature "User Signup" do
	scenario 'with valid details' do
		visit "/"	  
		click_link "Sign Up"
		fill_in "Email", with: "hitesh.songra@bacancytechnology.com"
		fill_in "Password", with: "India123"
		fill_in "Password confirmation", with: "India123"
		click_button "Sign up"
		expect(page).to have_content("You have signed up successfully")
	end	

end