class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @place.user_id = session[:user_id]
      @place.save
      redirect_to "/places"
    else
      flash[:notice] = "Login first."
    end
  end
end
