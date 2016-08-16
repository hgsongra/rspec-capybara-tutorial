require "rails_helper"

RSpec.feature "Listing all articles"  do
	before do
		@hitesh = User.create!(email: 'hgsongra@gmail.com', password: 'Password')
    login_as(@hitesh)
		@article = Article.create(title: "1st Article Title", body: "1st Article Body", user: @hitesh)
	end	

	scenario "List of articles" do
		visit "/"
		click_link @article.title
		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
	end
end