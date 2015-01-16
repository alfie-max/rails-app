class ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_article, except: [:index, :new, :create, :show]

    def index
      @articles = Article.all.paginate(page: params[:page], per_page: 7)
    end

    def show
      @article = Article.find params[:id]
      @comment = @article.comments.new
      @comments = @article.comments.paginate(page: params[:page], per_page: 3)
    end

    def new
      @article = current_user.articles.new
    end

    def create
      @article = current_user.articles.new(article_params)
      if @article.save
        flash[:notice] = "Successfully created..."
        redirect_to @article
      else
        flash[:error] = @article.errors.full_messages.to_sentence
        render :new
      end
    end

    def edit
    end

    def update
      if @article.update article_params
        flash[:notice] = "Successfully updated..."
        redirect_to @article
      else
        flash[:error] = @article.errors.full_messages.to_sentence
        redirect_to edit_article_path @article
      end
    end

    def destroy
      if @article.destroy
        flash[:notice] = "Successfully deleted..."
        redirect_to articles_path
      else
        flash[:error] = @article.errors.full_messages.to_sentence
        redirect_to @article
      end
    end

    private
      def article_params
        params.require(:article).permit(:title, :content, :video)
      end

      def set_article
        @article = current_user.articles.find(params[:id])
      end
end
