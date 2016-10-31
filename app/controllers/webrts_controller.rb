class WebrtsController < ApplicationController
  before_action :authenticate_user!
  #GET
  def index
    @maps = Map.all
  end

  #Find the profile you're trying to view
  #GET
  def profile
    @user = if params[:username] then User.find_by_username(params[:username].downcase) else current_user end
  end
end
