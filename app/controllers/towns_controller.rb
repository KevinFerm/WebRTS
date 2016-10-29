class TownsController < ApplicationController
  def town
    @town = Town.find(params[:id])
    @building = Building.where(town_id:@town.id)
  end

  #POST
  def build
    #Check if current_user can actually afford it
    if params[:type] == "swordsmen" && current_user.coins < (params[:amount].to_i*10)
      flash[:alert] = "You don't have enough coins!"
      redirect_to town_url(params[:town_id])
    elsif params[:type] == "bowmen" && current_user.coins < (params[:amount].to_i*10)
      flash[:alert] = "You don't have enough coins!"
      redirect_to town_url(params[:town_id])
    end
    #Start the building and remove coins from current_user
    if Building.build(params[:type], params[:town_id], current_user.id, params[:amount])
      flash[:notice] = "You have successfully started building your troops!"
      current_user.coins = current_user.coins-(params[:amount].to_i*10)
      current_user.save
      redirect_to town_url(params[:town_id])
    else
      flash[:alert] = "Failed to update building"
      redirect_to town_url(params[:town_id])
    end


  end

  def move

  end

end
