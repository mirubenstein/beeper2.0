class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless Connection.find_by(beeper_id: @user.id, follower_id: current_user.id)
      @connection = Connection.new
    else
      @connection = Connection.find_by(beeper_id: @user.id, follower_id: current_user.id)
    end
  end

end
