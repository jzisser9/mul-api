class API < Grape::API
  format :json

  mount Units::API
  mount UnitTypes::API
end