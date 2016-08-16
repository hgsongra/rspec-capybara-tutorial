require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #edit" do
    before do
      @hitesh = User.create!(email: 'hgsongra@gmail.com', password: 'password')
      @songra = User.create!(email: 'songra@gmail.com', password: 'password')
      @article = Article.create(title: '1st Article', body: '1st Article Body', user: @hitesh)
    end

    context "Owner allow to edit the article" do
      it 'render edit template' do
        login_user(@hitesh) 
        get :edit, id: @article
        expect(response).to render_template :edit
      end
    end

    context "Non-owner cannot allow to edit the article" do
      it 'render edit template' do
        login_user(@songra)
        get :edit, id: @article
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to have_content("You can edit only your own article")
      end
    end

  end

end
