class UnitTypes::API < Grape::API
  resource :unit_types do
    params do
      optional :name, type: String, desc: 'Name'
    end
    get do
      records = UnitType.all
      records = records.where(name: params[:name]) if params[:name]

      present records, with: Entities::UnitType
    end

    route_param :id do
      get do
        record = UnitType.find(params[:id])
        present record, with: Entities::UnitType
      end
    end
  end
end
