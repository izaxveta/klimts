class DashboardController < ApplicationController
  before_action :check_user

  def index
    @user = current_user
  end

  private
  def check_user
    redirect_to signin_path if !current_user
  end
end