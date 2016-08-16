require "rails_helper"

RSpec.feature "Delete articles"  do
	before do
		@hitesh = User.create!(email: 'hgsongra@gmail.com', password: 'Password')
    login_as(@hitesh)
		@article = Article.create(title: "1st Article Title", body: "1st Article Body", user: @hitesh)
	end	

	scenario "Delete article" do
		visit "/"
		click_link @article.title
		click_link "Delete"

		expect(page).to have_content("Article was successfully destroyed.")
		expect(current_path).to eq(articles_path)
	end

end