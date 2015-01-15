class VoteController < ApplicationController
  before_filter :find_article, :only => [:upvote, :downvote]

  def upvote
    @article.liked_by current_user
    if @article.vote_registered?
      flash[:notice] = "Upvoted..."
    end
    redirect_to @article
  end

  def downvote
    @article.downvote_from current_user
    if @article.vote_registered?
      flash[:notice] = "Downvoted..."
    end
    redirect_to @article
  end

  private

    def find_article
      @article = Article.find params[:id]
    end
end
