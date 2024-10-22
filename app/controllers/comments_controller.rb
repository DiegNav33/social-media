class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user # Lier le commentaire à l'utilisateur connecté

    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Comment posted successfully')
    else
      redirect_back(fallback_location: root_path, alert: 'Error posting comment')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
