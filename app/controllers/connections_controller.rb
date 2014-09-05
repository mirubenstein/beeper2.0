class ConnectionsController < ApplicationController

  def create
    @user = User.find(params[:connection][:beeper_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = Connection.find(params[:id]).beeper
    current_user.unfollow(@user)
    redirect_to @user
  end
end