class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end
end
