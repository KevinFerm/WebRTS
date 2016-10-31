class TownsController < ApplicationController
  #GET
  #Possibly lower the amount of queries being sent from the controller
  def town
    @town = Town.find(params[:id])
    @building = Building.where(town_id:@town.id)
    if @town.user_id == current_user.id
      @incoming = Movement.where(to_town:@town.id)
      @outgoing = Movement.where(from_town:@town.id)
    end
  end

  #GET for JQuery
  def getTowns
    @towns = Town.where(user_id:params[:user_id])
    render json: @towns
  end

  #GET Buildhandler
  def buildhandler
    Building.buildHandler()
    render html: "hej"
  end

  #GET movehandler
  def movehandler
    Movement.moveHandler()
    render html: "hej"
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

  #POST
  def move
    puts params[:from_user]
    puts current_user.id
    if params[:from_user] == current_user.id.to_s
      puts "Then this is true|"
      if Movement.beginMovement(params[:move_type], params[:bowmen], params[:swordsmen], params[:from_town_id], params[:to_town_id], params[:from_user], params[:to_user])
        flash[:notice] = "You successfully sent troops to this village"
        redirect_to town_url(params[:to_town_id])
      else
        flash[:alert] = "You don't have permission to send troops here!"
        redirect_to town_url(params[:to_town_id])
      end
    else
      flash[:alert] = "You don't have permission to send troops herezzz!"
      redirect_to town_url(params[:to_town_id])
    end
  end

end
