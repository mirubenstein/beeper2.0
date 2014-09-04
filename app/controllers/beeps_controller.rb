class BeepsController < ApplicationController

  def index
  @beeps = Beep.all
  @beep = current_user.beeps.new
  end

  def create
    @beep = current_user.beeps.new(beep_params)
    if @beep.save
      respond_to do |format|
        format.html { redirect_to root_path}
        format.js
      end
    else
      render 'new'
    end
  end

private
  def beep_params
    params.require(:beep).permit(:beep)
  end
end
