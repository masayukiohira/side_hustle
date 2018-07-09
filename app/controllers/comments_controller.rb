class CommentsController < ApplicationController
before_action :authenticate_user! && :status_user

  def new
  	@comment = Comment.new(user_id: current_user.id)
    @post = Post.find(params[:post_id])
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id

  	if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_to comments_post_path(@post.id)
  	else
      flash[:danger] = "コメントを投稿できません"
      render :new
  	end
  end

  def destroy
    post = Post.find(params[:post_id])
  	comment = current_user.comments.find_by!(post_id: params[:post_id]) #該当レコードがないと例外RecordNotFoundとなる。
  	comment.destroy
    flash[:success] = "コメントを削除しました"
  	redirect_to post_path(post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end

  def status_user
    redirect_to restricted_top_path if current_user.status?
  end
end

