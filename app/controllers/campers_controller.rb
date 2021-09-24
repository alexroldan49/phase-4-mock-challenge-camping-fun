class CampersController < ApplicationController



    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: ShowCamperSerializer
        else
            camper_not_found
        end

    end

    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            render json: {errors: [camper.errors]}, status: :unprocessable_entity
        end
    end

    private

    def camper_not_found
        render json: {errors: "camper not found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end
end
