class Admins::TopController < ApplicationController
before_action :authenticate_admin!
  def show
  end

  def start
  end
end
