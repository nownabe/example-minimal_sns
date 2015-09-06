class PostsController < ApplicationController
  before_filter :authenticate_user

  def create
    post = Post.new
    post.text = params[:text]
    post.user = current_user
    post.save!
    flash[:notice] = "投稿しました"
    redirect_to root_url
  end
end
