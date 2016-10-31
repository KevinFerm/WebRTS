class WebrtsController < ApplicationController
  before_action :authenticate_user!
  #GET
  def index
    @maps = Map.all
    @incoming = Movement.getIncomingByUserId(current_user.id)
    @outgoing = Movement.getOutgoingByUserId(current_user.id)
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
end
