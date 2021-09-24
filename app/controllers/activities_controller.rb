class ActivitiesController < ApplicationController


    def index
        render json: Activity.all
    end

    def show
        activity = Activity.find_by(id: params[:id])
        if activity
            render json: activity, status: :ok
        else
            render json: {errors: "Activity not found"}, status: :not_found
        end
    end

    def destroy
       activity = Activity.find_by(id: params[:id])
       if activity
        activity.destroy
        render json: {}, status: :ok
       else
           render json: {errors: "Activity not found"}, status: :not_found
       end
    end
    
    
end
