class MapsController < ApplicationController
  before_action :authenticate_user!
  #GET
  def getMapData
    @map = Map.getMapData(params[:x],params[:y],params[:size])
    @size = params[:size]
    @x = params[:x]
    @y = params[:y]
    render partial: 'map'
  end

  def map
    @x = 50
    @y = 50
    if params[:x] && params[:y]
      @x = params[:x]
      @y = params[:y]
    end
  end
end
