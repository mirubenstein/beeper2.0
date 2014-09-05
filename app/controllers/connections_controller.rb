class ConnectionsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    @connection = Connection.find_by(beeper_id: @user.id, follower_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @connection = Connection.find_by(beeper_id: @user.id, follower_id: current_user.id)

    current_user.unfollow(@user)
    respond_to do |format|
      format.js
    end
  end
end
