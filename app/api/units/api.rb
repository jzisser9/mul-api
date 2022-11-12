class Units::API < Grape::API
  resource :units do
    params do
      optional :name, type: String, desc: 'Name'
      optional :variant, type: String, desc: 'Variant SKU'
      optional :unit_type_id, type: Integer, desc: 'Unit Type ID'
      optional :mul_id, type: Integer, desc: 'Master Unit List ID'
    end
    get do
      records = Unit.all
      records = records.where(name: params[:name]) if params[:name]
      records = records.where(variant: params[:variant]) if params[:variant]
      records = records.where(unit_type_id: params[:unit_type_id]) if params[:unit_type_id]
      records = records.where(mul_id: params[:mul_id]) if params[:mul_id]

      present records, with: Entities::Unit
    end

    route_param :id do
      get do
        record = Unit.find(params[:id])
        present record, with: Entities::Unit, include_image_url: true
      end
    end
  end
end
