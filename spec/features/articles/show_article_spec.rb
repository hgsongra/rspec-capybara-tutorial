require "rails_helper"

RSpec.feature "Show details of article"  do
	before do
		@hitesh = User.create!(email: 'hgsongra@gmail.com', password: 'Password')
		@songra = User.create!(email: 'songra@gmail.com', password: 'Password')
		@article = Article.create(title: "1st Article Title", body: "1st Article Body", user: @hitesh)
	end	

	scenario "for non signed in user didn't see the Edit and Delete links" do
		visit root_path
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
		expect(page).not_to have_link("Edit")
		expect(page).not_to have_link("Delete")
	end

	scenario "for non-owner signed in user didn't see the Edit and Delete links" do
		visit root_path
		login_as(@songra)
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
		expect(page).not_to have_link("Edit")
		expect(page).not_to have_link("Delete")
	end

	scenario "for signed in owner can see the Edit and Delete links" do
		visit root_path
		login_as(@hitesh)
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
		expect(page).to have_link("Edit")
		expect(page).to have_link("Delete")
	end


end