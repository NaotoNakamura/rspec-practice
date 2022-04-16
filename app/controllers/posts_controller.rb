class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  # before_action :store_current_location, only: [:create, :edit, :destroy]

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "post created"
      redirect_to root_url
    else
      @posts = Post.all
      render action: :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.nil? || post.user_id != current_user.id
      redirect_to root_url
    end
    post.destroy
    flash[:success] = "Micropost deleted"
    redirect_to root_url
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end

    # def store_current_location
    #   store_location_for(:user, request.url)
    # end
end
