require "rails_helper"

RSpec.feature "Delete articles"  do
	before do
		@article = Article.create(title: "1st Article Title", body: "1st Article Body")
	end	

	scenario "Delete article" do
		visit "/"
		click_link @article.title
		click_link "Delete"

		expect(page).to have_content("Article was successfully destroyed.")
		expect(current_path).to eq(articles_path)
	end

end