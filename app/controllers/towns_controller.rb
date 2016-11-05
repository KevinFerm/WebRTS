class TownsController < ApplicationController
  attr_accessor :title, :town
  #GET
  #Possibly lower the amount of queries being sent from the controller
  def town
    @town = Town.find(params[:id])
    @population = @town.population
    @building = Building.where(town_id:@town.id)
    @units = Unit.all
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

  #PATCH
  def changeTitle
    @town = Town.find(params[:id])
    @town.title = params[:town][:title]
    if @town.save
      flash[:notice] = "You've changed the title of this town to: "+params[:town][:title]
      redirect_to town_path(params[:id])
    else
      flash[:alert] = "Something went wrong changing the title to: "+params[:town][:title]
      redirect_to town_path(params[:id])
    end
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
    unit = Unit.find(params[:unit][:id])
    if current_user.coins < (params[:amount].to_i*unit.cost)
      flash[:alert] = "You don't have enough coins!"
      redirect_to town_url(params[:town_id])
    end
    #Start the building and remove coins from current_user
    if Building.build(params[:unit][:id], params[:town_id], current_user.id, params[:amount])
      flash[:notice] = "You have successfully started building your troops!"
      current_user.coins = current_user.coins-(params[:amount].to_i*unit.cost)
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

  private
  def town_params
    params.required(:town).permit(:title)
    params.required(:unit).permit(:id)
  end

end
