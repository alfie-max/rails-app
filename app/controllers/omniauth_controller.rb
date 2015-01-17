class OmniauthController < ApplicationController
  def twitter
    auth = request.env["omniauth.auth"]
    raise auth.to_yaml
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
      user = User.find_by_email(auth.info.email)
      if user
        user.uid = auth.uid
        user.provider = auth.provider
        if !user.name
          user.name = auth.info.name
        end
        return user
      else
        password = Devise.friendly_token.first(8)
        User.create!(name: auth.info.name, email: auth.info.email, password: password,
                    uid: auth.uid, provider: auth.provider)
      end
    end
end
