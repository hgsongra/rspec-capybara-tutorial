require 'rails_helper'

RSpec.feature "Add comments on Article" do
	before do
		@hitesh = User.create(email: 'hgsongra@gmail.com', password: 'Password')
		@songra = User.create(email: 'songra@gmail.com', password: 'Password')
		@article = Article.create(title: "1st Article Title", body: "1st Article Body", user: @hitesh)
	end

	scenario "allow singed in user to add comments" do
		login_as(@songra)
		visit root_path
		click_link @article.title
		fill_in "Body", with: "Nice Article."
		click_button "Add Comment"

		expect(page).to have_content("Comment has been created")
		expect(page).to have_content("Nice Article.")
		expect(current_path).to eq(article_path(@article.comments.last))
	end
end