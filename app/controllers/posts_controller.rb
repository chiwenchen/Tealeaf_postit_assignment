class PostsController < ApplicationController

  #require 'pry'

  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  before_action :require_creator, only: [:edit, :update]
  # Use case:
  #   1. setup instance variable for action
  #   2. redirect base on some condition. EX: authutication.
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json do 
        render json: @post
      end
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(strong_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post is create successfully'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(strong_params)
      flash[:notice] = 'Your post is updated!'
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def vote # this action is been routed in route.rb using member syntex
    Vote.create(voteable: @post, voter: current_user, vote: params[:vote]) #voteable is polymorphic convention
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def set_post 
    @post = Post.find_by(slug: params[:id])
  end

  def require_creator
    access_denied unless logged_in? and (current_user == @post.creator || current_user.username == 'admin')
  end

  private

  def strong_params
    params.require(:post).permit(:title, :url, :description, :user_id) # permit! will permit all attributes
  end

end
