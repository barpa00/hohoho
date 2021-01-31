class MissionsController < ApplicationController
    def index
      @missions = Mission.all
    end

    def new
      @mission = Mission.new
    end

    def create
      @mission = Mission.new(mission_params)
      if @mission.save
        redirect_to missions_path, notice: "新增成功"
      else
        render :new
      end
    end

    private
    def mission_params
      params.require(:mission).permit(:title,:content)
    end
end
