class PostsController < ApplicationController

  #require 'pry'
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(strong_params)

    if @post.save
      flash[:notice] = 'Your post is create successfully'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

  end

  private

  def strong_params
    params.require(:post).permit! # permit! will permit all attributes
  end

end
