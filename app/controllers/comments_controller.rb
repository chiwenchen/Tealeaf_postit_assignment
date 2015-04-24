class CommentsController < ApplicationController

  before_action :require_user

  def create

    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    @post = @comment.post

    if @comment.save
      flash[:notice] = 'Comment is created'
      redirect_to post_path(@comment.post)
    else
      render 'posts/show'
    end
  end

  def vote
    comment = Comment.find(params[:id])
    Vote.create(voteable: comment, voter: current_user, vote: params[:vote])

    redirect_to :back
  end

end