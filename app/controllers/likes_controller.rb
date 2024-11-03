class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post_id:@post.id)
    if @like.save
      redirect_back fallback_location: root_path, notice: "Post liked", status: :see_other
    else
      render "posts/index"
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_back fallback_location: root_path, notice: "Post unliked", status: :see_other
  end

end
