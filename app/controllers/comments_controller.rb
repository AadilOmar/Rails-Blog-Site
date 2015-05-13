class CommentsController < ApplicationController

	def create
    puts "CREATING COMMENT"
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to user_article_path(@article.user, @article)
	end
 private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
