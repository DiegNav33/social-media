class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new(user_id: @user.id)
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
