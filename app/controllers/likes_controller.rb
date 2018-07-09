class LikesController < ApplicationController
before_action :authenticate_user! && :status_user

  def create
  	post = Post.find(params[:post_id])
  	like = current_user.likes.build(post_id: post.id)

  	if like.save
      flash[:success] = "いいね！しました"
      redirect_to post_path(post.id)
  	else
      flash[:danger] = "いいね！できません"
      redirect_to post_path(post.id)
  	end
  end

  def destroy
    post = Post.find(params[:post_id])
  	like = current_user.likes.find_by!(post_id: params[:post_id])
  	like.destroy
    flash[:success] = "いいね！を解除しました"
  	redirect_to post_path(post.id)
  end

  def status_user
    redirect_to restricted_top_path if current_user.status?
  end
end

