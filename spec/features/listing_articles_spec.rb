require "rails_helper"

RSpec.feature "Listing all articles"  do
	before do
		@article1 = Article.create(title: "1st Article Title", body: "1st Article Body")
		@article2 = Article.create(title: "2nd Article Title", body: "2nd Article Body")
	end	

	scenario "List of articles" do
		visit "/"
		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(page).to have_content(@article2.title)
		expect(page).to have_content(@article2.body)
	end
end