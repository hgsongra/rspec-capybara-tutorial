require 'rails_helper'

RSpec.feature "Create article" do
	scenario 'user create article' do
		visit "/"	  
		click_link "New Article"
		fill_in "Title", with: "1st article"
		fill_in "Body", with: "Whatever it is"
		click_button "Create Article"
		expect(page).to have_content("Article was successfully created.")
	end	
end