class HomeController < ApplicationController
  before_filter :authenticate_user, except: [:sign_in]

  def index
    @posts = Post.page(params[:page])
  end

  def sign_in
  end
end
