class UsersController < ApplicationController
before_action :authenticate_user! && :status_user

  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      if @user.unsubscribe == false
        flash[:success] = 'プロフィールが更新されました！'
        redirect_to user_path(@user.id)
      else
        redirect_to root_path
      end
    else
      flash[:danger] = 'プロフィールを更新できません'
      @posts = @user.posts
      render "users/show"
    end
  end

  def follows
    @user = User.find(params[:id])
    @inverse_followers = @user.inverse_followers
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user.id).all
  end

  def messages
    @user = User.find(params[:id])
    @room_id = message_room_id(current_user, @user)
    @messages = Message.recent_in_room(@room_id)
  end

  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
      "#{first_user.id}-#{second_user.id}"
    else
      "#{second_user.id}-#{first_user.id}"
    end
  end

  def unsubscribe
  end

  private

 def user_params
  params.require(:user).permit(:name, :image, :introduction, :unsubscribe)
 end

 def status_user
   redirect_to restricted_top_path if current_user.status?
 end
end