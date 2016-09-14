class CommentsController < ApplicationController

	before_filter :set_article

	def create
		@comment = @article.comments.build(comment_params)
		@comment.user = current_user
		respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment has been created' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { redirect_to :back }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def set_article
		@article = Article.find(params[:article_id])
	end
end
