class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    # return all the heroes through GET /heroes
    def index
        render json: Hero.all, status: :ok
    end

    # GET /heroes/:id
    def show
        hero = find_hero
        render json: hero, status: :ok
    end
    
    private

    def find_hero
        Hero.find_by!(id: params[:id])
    end

    def record_not_found
        render json: {error:"Hero not found"}, status: :not_found
    end
end
