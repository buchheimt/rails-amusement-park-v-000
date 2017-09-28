class SessionsController < ApplicationController

  def new
    redirect_to(user_path(current_user)) if logged_in?
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    if logged_in?
      session.delete :user_id
      redirect_to root_path
    end
  end

end
