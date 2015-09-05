class Users::OmniauthController < ApplicationController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "ログイン成功！"
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registratin_url
    end
  end
end
