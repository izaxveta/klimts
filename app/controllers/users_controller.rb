class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Ta-da! Registration successful!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name
      )
    end
end