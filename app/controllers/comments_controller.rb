class CommentsController < ApplicationController

  before_action :require_user

  def create

    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = Post.find_by(slug: params[:post_id])
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
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, voter: current_user, vote: params[:vote])
    respond_to do |format|
      format.html {redirect_to :back}
      format.js 
    end
    
  end

end