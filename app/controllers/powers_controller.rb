class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
    # GET /powers
    def index
        render json: Power.all, each_serialzer: PowerSerializer, status: :ok
    end

    # GET /powers/:id
    def show
        power = find_power
        render json: power
    end

    # PATCH /powers/:id
    def update
        power = find_power
        power.update!(description)
        render json: power, status: :accepted
    end

    private

    def find_power
        Power.find_by!(id: params[:id])
    end

    def record_not_found
        render json: {error:"Power not found"}, status: :not_found
    end

    def invalid_message invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
