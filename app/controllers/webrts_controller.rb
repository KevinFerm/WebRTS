class WebrtsController < ApplicationController
  before_action :authenticate_user!
  def index
    @maps = Map.all
  end

  #Find the profile you're trying to view
  def profile
    @user = if params[:username] then User.find_by_username(params[:username].downcase) else current_user end
  end
end
