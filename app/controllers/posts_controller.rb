class PostsController < ApplicationController

  #require 'pry'

  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  # Use case:
  #   1. setup instance variable for action
  #   2. redirect base on some condition. EX: authutication.
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(strong_params)
    @post.creator = current_user

    if @post.save
      flash[:success] = 'Your post is create successfully'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(strong_params)
      flash[:success] = 'Your post is updated!'
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def vote # this action is been routed in route.rb using member syntex
    post = Post.find(params[:id])
    Vote.create(voteable: post, voter: current_user, vote: params[:vote]) #voteable is polymorphic convention
    redirect_to :back
  end

  def set_post 
    @post = Post.find(params[:id])
  end

  private

  def strong_params
    params.require(:post).permit! # permit! will permit all attributes
  end

end
