require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do
	describe 'POST #create' do
	  before do
      @hitesh = User.create!(email: 'hgsongra@gmail.com', password: 'password')
      @songra = User.create!(email: 'songra@gmail.com', password: 'password')
      @article = Article.create(title: '1st Article', body: '1st Article Body', user: @hitesh)
	  end

	  context 'only signed in user' do
	  	it 'can create comment' do
	  		login_user @hitesh
	  		post :create, comment: {body: 'what a article'}, article_id: @article.id
	  		expect(flash[:notice]).to eq("Comment has been created")
	  	end
	  end

	  context 'non-signed in user' do
	  	it 'is redirected to login page' do
	  		login_user nil
	  		post :create, comment: {body: 'what a article'}, article_id: @article.id
	  		expect(response).to redirect_to new_user_session_path
	  	end
	  end

	end
end
