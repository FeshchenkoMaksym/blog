class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:edit, :delete]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def check_user
    if current_user != Post.find(params[:id]).user
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
