class CommentsController < ApplicationController
  def create
    article = Article.find params[:article_id]
    comment = Comment.new comment_params
    comment.user = current_user
    if comment.save
      article.comments << comment
      article.save
      flash[:notice] = "Comment Saved..."
    end
    redirect_to article
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
