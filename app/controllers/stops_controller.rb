class StopsController < ApplicationController

  def index
    @stops = Stop.all
    @nearby = Stop.by_distance(:origin => [params[:lat], params[:lon]]).limit(200)
    # For loading up console: Stop.by_distance(:origin => [34.013072799999996, -118.4950833]).limit(12)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
