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

	scenario 'validate article fields' do
		visit "/"	  
		click_link "New Article"
		fill_in "Title", with: ""
		fill_in "Body", with: ""
		click_button "Create Article"
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Body can't be blank")
	end

	scenario 'validate articles title field' do
		visit "/"	  
		click_link "New Article"
		fill_in "Title", with: ""
		fill_in "Body", with: ""
		click_button "Create Article"
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Body can't be blank")
	end

end