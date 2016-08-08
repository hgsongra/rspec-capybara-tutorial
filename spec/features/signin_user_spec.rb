require 'rails_helper'

RSpec.feature "User Signin" do
	
	before do
		@hitesh = User.create!(email: "hgsongra@gmail.com", password: "Password")
	end


	scenario 'with valid credentials' do
		visit "/"	  
		click_link "Sign In"
		fill_in "Email", with: @hitesh.email
		fill_in "Password", with: @hitesh.password
		click_button "Log in"
		expect(page).to have_content("Signed in successfully.")
	end	

	scenario 'with in-valid credentials' do
		visit "/"	  
		click_link "Sign In"
		fill_in "Email", with: @hitesh.email
		fill_in "Password", with: "123"
		click_button "Log in"
		expect(page).to have_content("Invalid Email or password")
	end	


end