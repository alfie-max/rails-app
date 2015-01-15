class OmniauthController < ApplicationController
  def twitter
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_user(auth)
    session[:user_id] = user.id
    sign_in user
    flash[:notice] = "Signed In !!"
    redirect_to root_url
  end

  def github
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_user(auth)
    session[:user_id] = user.id
    sign_in user
    flash[:notice] = "Signed In !!"
    redirect_to root_url
  end

  private
    def create_user(auth)
      password = Devise.friendly_token.first(8)
      email = "example" + User.last.id.to_s + "@domain.com"
      User.create!(email: email, password: password,
                    uid: auth.uid, provider: auth.provider)
    end
end
