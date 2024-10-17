class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new(user_id: @user.id)
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to profile_path(@user), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :city, images: [])
  end
end
