require "rails_helper"

RSpec.feature "Listing all articles"  do
	before do
		@hitesh = User.create!(email: 'hgsongra@gmail.com', password: 'Password')
		@article1 = Article.create(title: "1st Article Title", body: "1st Article Body", user: @hitesh)
		@article2 = Article.create(title: "2nd Article Title", body: "2nd Article Body", user: @hitesh)
	end	

	scenario "List of articles" do
		visit "/"
		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(page).to have_content(@article2.title)
		expect(page).to have_content(@article2.body)
		expect(page).not_to have_link("New Article")
	end
end