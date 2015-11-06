class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorite_places.new(favorite_params)
    if @favorite.save
       redirect_to :back, notice: "You favorited #{Place.find(params[:id]).name}"
    else
      @place = Place.find(params[:id])
      flash.now[:error] = "There was an error."
      render 'places/show'
    end
  end

  def destroy
    if current_user.favorite_places.find(params[:favorite_id]).destroy
      redirect_to place_path(params[:id]), notice: "You unfavorited #{Place.find(params[:id]).name}"
    else
      @place = Place.find(params[:id])
      flash.now[:error] = "There was an error."
      render 'places/show'
    end
  end

  private
    def favorite_params
      ActionController::Parameters.new(place_id: params[:id]).permit(:place_id)
    end
end
