require "rails_helper"

RSpec.feature "Update articles"  do
	before do
		@article = Article.create(title: "1st Article Title", body: "1st Article Body")
	end	

	scenario "Update article" do
		visit "/"
		click_link @article.title
		click_link "Edit"

		fill_in "Title", with: "Article Title Updated "
		fill_in "Body", with: "Article Body Updated"
		click_button "Update Article"

		expect(page).to have_content("Article was successfully updated.")
		expect(current_path).to eq(article_path(@article))
	end

	scenario "Update article failes" do
		visit "/"
		click_link @article.title
		click_link "Edit"

		fill_in "Title", with: ""
		fill_in "Body", with: "Article Body Updated"
		click_button "Update Article"

		expect(page).to have_content("Title can't be blank")
		expect(current_path).to eq(article_path(@article))
	end

end