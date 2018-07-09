class ReportsController < ApplicationController
before_action :authenticate_user! && :status_user

  def new
    @report = Report.new(user_id: current_user.id)
  end

  def create
    post = Post.find(params[:post_id])
    report = current_user.reports.build(report_params)
    report.post_id = post.id

    if report.save
      flash[:success] = "問題を報告しました"
      redirect_to post_path(post.id)
    else
      flash[:danger] = "問題を報告できません"
      redirect_to posts_path(post.id)
    end
  end

  private

  def report_params
    params.require(:report).permit(:user_id, :post_id, :content)
  end

  def status_user
    redirect_to restricted_top_path if current_user.status?
  end
end




