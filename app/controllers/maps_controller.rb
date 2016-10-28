class MapsController < ApplicationController
  def getMapData
    @map = Map.getMapData(params[:x],params[:y],params[:size])
    @size = params[:size]
    @middle = params[:x] +','+params[:y]
    render 'map'
  end
end
