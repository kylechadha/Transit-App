class StopsController < ApplicationController

  def index
    @stops = Stop.all
    @stopInfo = Stop.within(0.2, :origin => [params[:lat], params[:lon]])


    respond_to do |format|
      format.html
      format.js
    end
  end
end
