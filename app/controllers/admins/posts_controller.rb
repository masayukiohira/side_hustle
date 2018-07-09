class Admins::PostsController < ApplicationController
before_action :authenticate_admin!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def show
    @post = Post.find(params[:id])
  end

end
