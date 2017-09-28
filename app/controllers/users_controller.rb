class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    redirect_to(root_path) unless logged_in?
    @user = User.find(params[:id])
  end

  def ride
    @user = User.find(params[:id])
    ride = Ride.new(user_id: @user.id, attraction_id: params[:attraction][:id])
    ride.save if flash[:alert] = ride.take_ride
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
