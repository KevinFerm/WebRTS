class MapsController < ApplicationController
  def getMapData
    @map = Map.getMapData(params[:x],params[:y],params[:size])
    @size = params[:size]
    @x = params[:x]
    @y = params[:y]
    render partial: 'map'
  end
end
