class Admins::UsersController < ApplicationController
before_action :authenticate_admin!

  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールが更新されました！'
      redirect_to edit_admins_user_path(@user.id)
    else
      flash[:danger] = 'プロフィールを更新できません'
      render :edit
    end
  end

  def destroy
  end

  private

 def user_params
    params.require(:user).permit(:name, :introduction, :image, :title, :status, :followers_count, :unsubscribe)
 end

 def search_params
    params.require(:q).permit!
 end

end
