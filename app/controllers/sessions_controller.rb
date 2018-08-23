class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if authenticated?(user, params)
      set_session(user)
      flash[:success] = 'Sign in successful!'
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid credentials. Please try again.'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = 'Sign out successful.'
    redirect_to root_path
  end

  private
    def authenticated?(user, params)
      user && user.authenticate(params[:session][:password])
    end

    def set_session(user)
      session[:user] = user.id
    end
end