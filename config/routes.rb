Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth"}
  resources :articles do
    resources :comments, only: :create do
      # member do
      # get "/upvote", to: "vote#upvote"
      # get "/downvote", to: "vote#downvote"
      # end
    end
    member do
      get "/upvote", to: "vote#upvote", as: "upvote"
      get "/downvote", to: "vote#downvote", as: "downvote"
    end
  end

  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

  root 'articles#index'
end
