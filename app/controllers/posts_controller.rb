class PostsController < ApplicationController

	require 'pry'
  
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

end
