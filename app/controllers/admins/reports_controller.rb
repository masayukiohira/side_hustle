class Admins::ReportsController < ApplicationController
before_action :authenticate_admin!

  def index
    @q = Report.ransack(params[:q])
    @reports = @q.result
  end
end
