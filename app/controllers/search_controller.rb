class SearchController < ApplicationController
  def index
    @users = User.where("pseudo ILIKE :query OR first_name ILIKE :query OR last_name ILIKE :query", query: "%#{params[:query]}%")
    @posts = Post.joins(:user).where("users.pseudo ILIKE :query OR posts.city ILIKE :query", query: "%#{params[:query]}%")
  end
end
