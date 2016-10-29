class TownsController < ApplicationController
  def town
    @town = Town.find(params[:id])
  end
end
