class PlacesController < ApplicationController

  def index
    @places = Place.all
    @categories = Category.all
    @placo = Place.joins(:category).where('category_id' => [3])
  end

  def show_category
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

  private
  def place_params
    params.require(:place).permit(:name, :image, :location, :schedule, :description, :mood_id, :category_id)
  end

end
