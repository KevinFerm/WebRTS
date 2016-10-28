class MapsController < ApplicationController
  def map
    @map = getMapData(params[:x],params[:y],params[:size])
  end
end
