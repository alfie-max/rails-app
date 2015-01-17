class UsersController < ApplicationController
  before_filter :get_user, :get_articles, only: [:follow, :unfollow, :show]

  def follow
    current_user.follow(@user)
    flash[:notice] = "You are now following #{@user.name}."
    redirect_to @user
  end

  def unfollow
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following #{@user.name}."
    redirect_to @user
  end


  private

    def get_user
      @user = User.find_by_id(params[:id]) || current_user
    end

    def get_articles
      @articles = @user.articles.paginate(page: params[:page], per_page: 7)
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
