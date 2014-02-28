class StopsController < ApplicationController

  def index
    @stops = Stop.all
    @nearby = Stop.by_distance(:origin => [params[:lat], params[:lon]]).limit(10)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
