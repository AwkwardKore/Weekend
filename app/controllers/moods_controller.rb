class MoodsController < ApplicationController
    def index
      @moods = Mood.all
    end

    def show
      @mood = Mood.find(params[:id])
    end

    def new
      @mood = Mood.new
    end

    def create
      @mood = Mood.new(mood_params)

      if @mood.save
       redirect_to @mood
      else
       render 'new'
      end
    end

    def edit
      @mood = Mood.find(params[:id])
    end

    def update
      @mood = Mood.find(params[:id])

      if @mood.update(mood_params)
      redirect_to @mood
      else
      render 'edit'
      end
    end

    def destroy
      @mood = Mood.find(params[:id])
      @mood.destroy

      redirect_to moods_path
    end

    def places
      @places = Mood.find(params[:id]).places
    end

    private
    def mood_params
      params.require(:mood).permit(:name)
    end
end
