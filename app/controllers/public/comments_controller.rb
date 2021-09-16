class Public::CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    @post.create_notification_comment(current_user, @comment.id)
    render :index
  end 
  
  def destroy
    @post = Post.find(params[:post_id])
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    render :index
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
