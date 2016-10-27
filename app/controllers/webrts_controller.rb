class WebrtsController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def profile
    @user = if params[:username] then User.find_by_username(params[:username].downcase) else current_user end
  end
end
