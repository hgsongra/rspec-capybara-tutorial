require 'rails_helper'

RSpec.feature "Signed out signin user" do
	
	before do
		@hitesh = User.create!(email: "hgsongra@gmail.com", password: "Password")
		visit "/"	  
		click_link "Sign In"
		fill_in "Email", with: @hitesh.email
		fill_in "Password", with: @hitesh.password
		click_button "Log in"
	
	end	

	scenario do
		visit "/"	  
		click_link "Logout"
		expect(page).to have_content("Signed out successfully.")
	end	


end