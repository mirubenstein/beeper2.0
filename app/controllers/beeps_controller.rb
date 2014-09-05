class BeepsController < ApplicationController

  def index
  @beeps = Beep.all
  @beep = Beep.new
  end

  def new
    @beep = current_user.beeps.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @beep = current_user.beeps.new(beep_params)
    @beep.photo = params[:beep][:photo]
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
    params.require(:beep).permit(:beep, :photo)
  end
end
