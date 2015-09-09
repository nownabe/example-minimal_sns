class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_user
    redirect_to sign_in_url unless user_signed_in?
  end

  def after_sign_out_path_for(_)
    "https://www.google.co.jp/"
  end
end
