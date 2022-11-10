class UnitTypesController < ApplicationController
  def index
    records = UnitType.all
    records = records.where(name: params[:name]) if params[:name]

    render json: records
  end

  def show
    render json: UnitType.find(params[:id])
  end
end
