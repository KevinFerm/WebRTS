class WebrtsController < ApplicationController
  before_action :authenticate_user!
  #GET
  def index
    @maps = Map.all
    @incoming = Movement.getIncomingByUserId(current_user.id)
    @outgoing = Movement.getOutgoingByUserId(current_user.id)
    @units = Unit.all
    @unit = Unit.new
    puts @units
  end

  #POST
  def createUnit
    params.permit!
    @unit = Unit.create(params[:unit])
    if @unit
      flash[:notice] = "You've added a new unit"
      redirect_to '/'
    else
      flash[:alert] = "You've failed to create unit somehow"
      redirect_to '/'
    end
  end

  #Find the profile you're trying to view
  #GET
  def profile
    @user = if params[:username] then User.find_by_username(params[:username].downcase) else current_user end
    if @user.id == current_user.id
      @towns = @user.towns.paginate(:page => params[:page])
    end
    @incoming = Movement.getIncomingByUserId(current_user.id)
    @outgoing = Movement.getOutgoingByUserId(current_user.id)
  end

  #UnitParams
  private
  def unit_params
    @units = Unit.all
    params.require(:unit).permit(:name, :health, :armor, :speed, :attack, :max_hit, :min_hit, :range)
    @units.each do |unit|
      params.require(:units).permit(unit.name)
    end
  end
end
