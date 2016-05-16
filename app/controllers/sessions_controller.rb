class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    elsif request.xhr?
      render partial: 'sessions/new'
    else
      render 'new'
    end
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
