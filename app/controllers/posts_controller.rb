class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :delete]
  before_action :load_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to posts_path if @post.destroy
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def authorize_user
    redirect_to root_path if current_user != Post.find(params[:id]).user
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
