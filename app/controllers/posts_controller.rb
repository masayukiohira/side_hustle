class PostsController < ApplicationController
  before_action :authenticate_user! && :status_user

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def category
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = '新規投稿されました'
      redirect_to user_path(current_user)
    else
      flash[:danger] = '新規投稿できません'
      @post = Post.new
      render :new
    end
  end

  def comments
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = @post.user
  end

  def likes
    @post = Post.find(params[:id])
    @likes = @post.likes
    @user = @post.user
  end

  def timeline
    @posts = Post.eager_load(user: :inverse_follows).where(follows: { follower_id: current_user.id })
  end

  def destroy
    post = Post.find(params[:id])
    flash[:success] = '投稿を削除しました'
    post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :title, :body, :image, :likes_count, :comments_count, :category)
  end

  def search_params
    params.require(:q).permit!
  end

  def status_user
    redirect_to restricted_top_path if current_user.status?
  end
end
