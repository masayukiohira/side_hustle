class TopController < ApplicationController
before_action :authenticate_user!, :except=>[:show, :about]

  def show
  end

  def about
  end

  def start
    @posts = Post.eager_load(user: :inverse_follows).where(follows: { follower_id: current_user.id })
  end

  def confirm
  end

  def taxreturn
  end

  def restricted
  end
end
