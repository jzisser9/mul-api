class UnitsController < ApplicationController
  def index
    records = Unit.all
    records = records.where(name: params[:name]) if params[:name]
    records = records.where(variant: params[:variant]) if params[:variant]
    records = records.where(unit_type_id: params[:unit_type_id]) if params[:unit_type_id]
    records = records.where(mul_id: params[:mul_id]) if params[:mul_id]

    render json: records
  end

  def show
    render json: Unit.find(params[:id])
  end
end
