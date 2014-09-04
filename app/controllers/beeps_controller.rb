class BeepsController < ApplicationController

  def index
  @beeps = Beep.all
  end
end
