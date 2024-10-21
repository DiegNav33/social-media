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
    #Keep the existing images et add the new ones if exists
    if params[:posts][:images].present?
      @post.images.attach(params[:post][:images]) #Add new images
    end

    #Delete all the images in the params hash to avoid the reboot  of it
    params[:posts].delete(:images)
    if @post.update(post_params)
      redirect_to advert_path(@post), notice: "Post successfully updated", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @post.destroy
    redirect_to profile_path(@user), status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :city, images: [])
  end
end
