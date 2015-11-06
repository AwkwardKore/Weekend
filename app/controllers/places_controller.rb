class PlacesController < ApplicationController

  def index
    @places = Place.all
    @categories = Category.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
     redirect_to @place
    else
     render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
    redirect_to @place
    else
    render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    redirect_to places_path
  end

  # def favorite
  #   type = params[:type]
  #   if type == "favorite"
  #     current_user.favorite_places.create(favorite_params)
  #     redirect_to :back, notice: 'You favorited #{@place.name}'
  #
  #   elsif type == "unfavorite"
  #     current_user.favorites.delete(@place)
  #     redirect_to :back, notice: 'Unfavorited #{@place.name}'
  #
  #   else
  #     # Type missing, nothing happens
  #     redirect_to :back, notice: 'Nothing happened.'
  #   end
  # end

  private
  def place_params
    params.require(:place).permit(:name, :image, :location, :schedule, :description, :mood_id, :category_id)
  end

  # def favorite_params
  #   params.require(:)
  # end
end
