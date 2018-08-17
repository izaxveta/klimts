class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if email_registered?(user)
      flash[:error] = "This email is already registered."
      redirect_to register_path
    elsif user.save
      flash[:success] = "Ta-da! Registration successful!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong."
      redirect_to register_path
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

    def email_registered?(user)
      User.where(email: user.email).present?
    end
end