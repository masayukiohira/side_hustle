class FavoritesController < ApplicationController
before_action :authenticate_user! && :status_user

  def create
  	post = Post.find(params[:post_id])
  	favorite = current_user.favorites.build(post_id: post.id)

  	if favorite.save
      flash[:success] = "ブックマークに登録しました"
      redirect_to post_path(post.id)
  	else
      flash[:danger] = "ブックマークに登録できません"
  		redirect_to post_path(post.id)
  	end
  end

  def destroy
    post = Post.find(params[:post_id])
  	favorite = current_user.favorites.find_by!(post_id: params[:post_id])
  	favorite.destroy
    flash[:success] = "ブックマークを解除しました"
  	redirect_to post_path(post.id)
  end

  def status_user
    redirect_to restricted_top_path if current_user.status?
  end
end
